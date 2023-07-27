import axios from "axios";
import * as helper from "../services/serviceHelpers";

const endpoint = `${helper.API_HOST_PREFIX}/api/personalvalues`;
const rankingsEndpoint = `${endpoint}/rankings`;

const getByUserId = () => {
  const config = {
    method: "GET",
    url: `${rankingsEndpoint}`,
    withCredentials: true,
    crossdomain: true,
    headers: { "Content-Type": "application/json" },
  };
  return axios(config).then(helper.onGlobalSuccess).catch(helper.onGlobalError);
};

const create = (newPersonalValueRank) => {
  const payload = {
    PersonalValueId: newPersonalValueRank.personalValue,
    Rank: newPersonalValueRank.rank,
    Sort: newPersonalValueRank.sort,
  };
  const config = {
    method: "POST",
    url: `${rankingsEndpoint}`,
    data: payload,
    withCredentials: true,
    crossdomain: true,
    headers: { "Content-Type": "application/json" },
  };
  return axios(config).then(helper.onGlobalSuccess).catch(helper.onGlobalError);
};

const deleteById = (personalValueId) => {
  const config = {
    method: "DELETE",
    url: `${rankingsEndpoint}/${personalValueId}`,
    withCredentials: true,
    crossdomain: true,
    headers: { "Content-Type": "application/json" },
  };
  return axios(config).then(helper.onGlobalSuccess).catch(helper.onGlobalError);
};

const updateSort = (payload) => {
  const config = {
    method: "PUT",
    url: `${rankingsEndpoint}/sort`,
    data: payload,
    withCredentials: true,
    crossdomain: true,
    headers: { "Content-Type": "application/json" },
  };
  return axios(config).then(helper.onGlobalSuccess).catch(helper.onGlobalError);
};

const personalValueRankService = {
  getByUserId,
  create,
  deleteById,
  updateSort,
};
export default personalValueRankService;
