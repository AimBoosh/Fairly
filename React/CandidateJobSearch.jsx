import React, { useState, useEffect, useRef } from "react";
import { useNavigate } from "react-router-dom";
import "./candidatejobsearch.css";
import JobCard from "../../../../components/jobsearch/JobCard";
import Pagination from "rc-pagination";
import "rc-pagination/assets/index.css";
import jobService from "../../../../services/jobService";
import JobLargeView from "../../../../components/jobsearch/JobLargeView";
import CandidateJobFilter from "./CandidateJobFilter";
import JobsLocationSearch from "../../../../components/jobsearch/JobLocationSearch";
import PropTypes from "prop-types";
import toastr from "toastr";
import { Col, Row, Button, Form, InputGroup } from "react-bootstrap";

const RADIUS_OPTIONS = [
  { label: "Within 5 miles", value: 5 },
  { label: "Within 10 miles", value: 10 },
  { label: "Within 25 miles", value: 25 },
  { label: "Within 50 miles", value: 50 },
  { label: "Within 100 miles", value: 100 },
];

const defaultPage = {
  pageIndex: 0,
  pageSize: 5,
  query: "",
  filterByJobType: null,
  queryByLocation: "",
  radius: 0,
  lat: "",
  long: "",
};

function CandidateJobSearch({ currentUser }) {
  const [jobsPageData, setJobsPageData] = useState({
    jobsOrgArr: [],
    jobsNewArr: [],
    totalCount: [],
    jobCardData: {},
    toggleLargeView: false,
    ...defaultPage,
  });

  const [selectedCardId, setSelectedCardId] = useState(null);

  const [radiusOptions, setRadiusOptions] = useState([]);

  const ref = useRef(null);

  const navigate = useNavigate();

  useEffect(() => {
    setRadiusOptions(RADIUS_OPTIONS.map(mapRadius));
  }, []);

  useEffect(() => {
    if (jobsPageData.radius && jobsPageData.lat && jobsPageData.long) {
      jobService
        .getJobsByLocation(
          jobsPageData.pageIndex,
          jobsPageData.pageSize,
          jobsPageData.lat,
          jobsPageData.long,
          jobsPageData.radius
        )
        .then(getJobsSuccess)
        .catch(getJobsError);
    } else if (jobsPageData.filterByJobType) {
      jobService
        .getJobsSearch(
          jobsPageData.pageIndex,
          jobsPageData.pageSize,
          jobsPageData.filterByJobType.label
        )
        .then(getJobsSuccess)
        .catch(getJobsError);
    } else if (jobsPageData.query) {
      jobService
        .getJobsSearch(
          jobsPageData.pageIndex,
          jobsPageData.pageSize,
          jobsPageData.query
        )
        .then(getJobsSuccess)
        .catch(getJobsError);
    } else {
      jobService
        .getJobsPaginated(jobsPageData.pageIndex, jobsPageData.pageSize)
        .then(getJobsSuccess)
        .catch(getJobsError);
    }
  }, [
    jobsPageData.pageIndex,
    jobsPageData.filterByJobType,
    currentUser.isLoggedIn,
  ]);

  const getJobsSuccess = (data) => {
    let arrOfJobs = data.item.pagedItems;

    setJobsPageData((prevState) => {
      const pageData = { ...prevState };
      pageData.jobsOrgArr = arrOfJobs;
      pageData.jobsNewArr = arrOfJobs.map(mapJobCard);
      pageData.totalCount = data.item.totalCount;

      return pageData;
    });
  };

  const getJobsError = (err) => {
    toastr.error(
      "Sorry! We didn’t find any jobs matching your criteria or search area. Please modify your search and try again."
    );
  };

  const passCardInfo = (jobData) => {
    let clickedCardData = jobData;
    setJobsPageData((prevState) => {
      const pageData = { ...prevState };
      pageData.jobCardData = clickedCardData;
      pageData.toggleLargeView = true;

      return pageData;
    });
  };

  const onApplyRequest = (jobId) => {
    if (currentUser.isLoggedIn === true) {
      navigate(`/jobs/${jobId}`);
    } else {
      navigate(`/auth/signin`, {
        state: { jobpayload: `/jobs/${jobId}`, type: "JOBAPP" },
      });
    }
  };

  const onJobQuery = () => {
    const initialIndex = 0;
    if (jobsPageData.lat && jobsPageData.long && jobsPageData.radius > 0) {
      jobService
        .getJobsByLocation(
          initialIndex,
          jobsPageData.pageSize,
          jobsPageData.lat,
          jobsPageData.long,
          jobsPageData.radius
        )
        .then((response) => handleSuccess(response))
        .catch(getJobsError);
    } else if (jobsPageData.query === "") {
      onReset();
    } else {
      jobService
        .getJobsSearch(initialIndex, jobsPageData.pageSize, jobsPageData.query)
        .then((response) => handleSuccess(response))
        .catch(getJobsError);
    }
  };

  const onReset = () => {
    setJobsPageData((prevState) => ({
      ...prevState,
      ...defaultPage,
    }));
    if (ref.current) {
      ref.current.value = "";
    }
    jobService
      .getJobsPaginated(defaultPage.pageIndex, defaultPage.pageSize)
      .then(getJobsSuccess)
      .catch(getJobsError);
  };

  const handleSuccess = (data) => {
    let resetPageIndex = 0;
    let resetRadius = 0;
    let jobQuery = data.item.pagedItems;

    setJobsPageData((prevState) => {
      const pageData = { ...prevState };
      pageData.jobsNewArr = jobQuery.map(mapJobCard);
      pageData.totalCount = data.item.totalCount;
      pageData.pageIndex = resetPageIndex;
      pageData.filterByJobType = null;
      pageData.query = "";
      pageData.radius = resetRadius;

      return pageData;
    });

    if (ref.current) {
      ref.current.value = "";
    }
  };

  const filterByJobType = (value) => {
    setJobsPageData((prevState) => ({
      ...prevState,
      ...defaultPage,
      filterByJobType: value,
    }));
  };

  const onRadiusChange = (event) => {
    const selectValue = event.target.value;
    setJobsPageData((prevState) => {
      const selectRadiusValue = {
        ...prevState,
      };
      selectRadiusValue.radius = selectValue;

      return selectRadiusValue;
    });
  };

  const onPageChange = (page) => {
    setJobsPageData((prevData) => {
      const pageData = { ...prevData };
      pageData.pageIndex = page - 1;
      return pageData;
    });
  };

  const onSearchJobsChange = (event) => {
    const target = event.target;
    const inputValue = target.value;
    const nameOfField = target.name;
    setJobsPageData((prevState) => {
      const searchQueryData = {
        ...prevState,
      };

      searchQueryData[nameOfField] = inputValue;

      return searchQueryData;
    });
  };

  const mapRadius = (radius) => {
    return (
      <option value={radius.value} key={`radius_${radius.value}`}>
        {radius.label}
      </option>
    );
  };

  const mapJobCard = (aJob) => {
    return (
      <JobCard
        onClickApply={onApplyRequest}
        passCardInfo={passCardInfo}
        job={aJob}
        key={aJob.id}
        currentUser={currentUser}
        selectedCardId={selectedCardId}
        isSelected={selectedCardId === aJob.id}
        setCardIdState={setSelectedCardId}
      ></JobCard>
    );
  };

  return (
    <div className="container">
      <div className="candidate-job-search">
        <div name="searchToolBarComponent" className="mb-3">
          <h1 name="search-label">Search For Jobs</h1>
          <Row size="sm">
            <Col md="4" className="col">
              <InputGroup className="input-group">
                <InputGroup.Text>By Keywords</InputGroup.Text>
                <Form.Control
                  type="text"
                  name="query"
                  placeholder="Job Title or Keyword"
                  className="form-control"
                  value={jobsPageData.query}
                  size="lg"
                  onChange={onSearchJobsChange}
                />
              </InputGroup>
            </Col>
            <Col lg="8" className="col">
              <InputGroup className="input-group">
                <InputGroup.Text>By Location</InputGroup.Text>
                <Col sm="4" className="col">
                  <JobsLocationSearch
                    setJobsPageData={setJobsPageData}
                    refValue={ref}
                  ></JobsLocationSearch>
                </Col>
                <Col lg="3" className="col">
                  <Form.Select
                    component="select"
                    name="radius"
                    className="form-control width=50"
                    onChange={onRadiusChange}
                    size="lg"
                    value={jobsPageData.radius}
                  >
                    <option value="">Distance</option>
                    {radiusOptions}
                  </Form.Select>
                </Col>
                <Button
                  variant="primary"
                  className="ms-1 rounded"
                  type="submit"
                  onClick={onJobQuery}
                  size="lg"
                >
                  Search
                </Button>
              </InputGroup>
            </Col>
          </Row>
          <Col className="col">
            <CandidateJobFilter
              filterByJobType={filterByJobType}
              filterSelection={jobsPageData.filterByJobType}
            ></CandidateJobFilter>
          </Col>
        </div>
        <div className="row">
          <div name="cards-results" className="col">
            <Pagination
              className="mb-2"
              onChange={onPageChange}
              pageSize={jobsPageData.pageSize}
              current={jobsPageData.pageIndex + 1}
              total={jobsPageData.totalCount}
            />
            {jobsPageData.jobsNewArr}
          </div>
          {jobsPageData.toggleLargeView === true ? (
            <JobLargeView
              cardData={jobsPageData.jobCardData}
              currentUser={currentUser}
              onClickApply={onApplyRequest}
            />
          ) : (
            <div name="large-view" className="col text-center">
              <div>
                <h1 className="font-weight-bold mt-6">
                  We have found thousands of jobs that Fairly match you!
                </h1>
                <p className="font-weight-bold mt-5">
                  Click your results on the left to display here.
                </p>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

CandidateJobSearch.propTypes = {
  currentUser: PropTypes.shape({
    email: PropTypes.string.isRequired,
    id: PropTypes.number.isRequired,
    isLoggedIn: PropTypes.bool.isRequired,
  }).isRequired,
};

export default CandidateJobSearch;
