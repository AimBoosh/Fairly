import { lazy } from "react";

const PageNotFound = lazy(() => import("../components/errors/Error404"));
const RelatedPersonalValues = lazy(() =>
  import("../components/relatedpersonalvalues/RelatedPersonalValues")
);
const Jobs = lazy(() => import("../components/jobs/Jobs"));
const UsersEducationList = lazy(() =>
  import("../components/testlist/UserEducationList")
);
const UserDemographics = lazy(() =>
  import("../components/users/UserDemographics")
);
const EducationRequirements = lazy(() =>
  import("../components/education/EducationRequirements")
);
const JobLinks = lazy(() => import("../components/joblinks/JobLinks"));
const LicensesList = lazy(() => import("../components/licenses/LicensesList"));
const LicenseForm = lazy(() => import("../components/licenses/LicenseForm"));
const ExternalLinkForm = lazy(() =>
  import("../components/externallinks/ExternalLinkForm")
);

const externallinkRoutes = [
  {
    path: "/externallinks/add",
    name: "External Links",
    element: ExternalLinkForm,
    roles: ["Candidate", "HiringAdmin", "OrgAdmin", "SysAdmin"],
    exact: true,
    isAnonymous: false,
  },
  {
    path: "/externallinks/:id/edit",
    name: "External Links",
    element: ExternalLinkForm,
    roles: ["Candidate", "HiringAdmin", "OrgAdmin", "SysAdmin"],
    exact: true,
    isAnonymous: false,
  },
  {
    path: "/externallinks",
    name: "External Links List",
    element: ExternalLinkList,
    roles: ["Candidate", "HiringAdmin", "OrgAdmin", "SysAdmin"],
    exact: true,
    isAnonymous: false,
  },
];

const dashboardRoutes = [
  {
    path: "/dashboard",
    name: "Dashboards",
    header: "Navigation",
    children: [
      {
        path: "/dashboard/admin",
        name: "Admin",
        header: "Navigation",
        children: [
          {
            path: "/dashboard/admin/users",
            name: "User Admin",
            element: UsersAdmin,
            roles: ["SysAdmin"],
            exact: true,
            isAnonymous: false,
          },
        ],
      },
     
    ],
  },
];

const personalValuesRankingRoutes = [
  {
    path: "/dashboard/personalvalues/ranking",
    name: "PersonalValuesRanking",
    header: "",
    children: [
      {
        path: "/dashboard/personalvalues/ranking",
        name: "PersonalValueRanking",
        element: PersonalValueRank,
        roles: ["Candidate", "SysAdmin"],
        exact: true,
        isAnonymous: false,
      },
      {
        path: "/dashboard/personalvalues/related",
        name: "RelatedPersonalValues",
        element: RelatedPersonalValues,
        roles: ["SysAdmin"],
        exact: true,
        isAnonymous: false,
      },
    ],
  },
];

const files = [
  {
    path: "/dashboard/files",
    name: "Files",
    element: FileManagerMain,
    isAnonymous: false,
    exact: false,
    roles: ["SysAdmin"],
  },
  {
    path: "/dashboard/resume",
    name: "PDF Viewer",
    element: PdfWizard,
    isAnonymous: false,
    exact: false,
    roles: ["OrgAdmin", "HiringAdmin", "Candidate"],
    roles: ["SysAdmin", "OrgAdmin", "HiringAdmin", "Candidate"],
  },
];

const licenseRoutes = [
  {
    path: "/licenses",
    name: "Licenses",
    header: "Licenses",
    children: [
      {
        path: "/licenses",
        name: "LicensesList",
        element: LicensesList,
        roles: ["Candidate", "SysAdmin"],
        exact: true,
        isAnonymous: false,
      },
      {
        path: "/licenses/add",
        name: "Add New License",
        element: LicenseForm,
        roles: ["Candidate", "SysAdmin"],
        exact: true,
        isAnonymous: false,
      },
      {
        path: "/licenses/:id/edit",
        name: "Update License",
        element: LicenseForm,
        roles: ["Candidate", "SysAdmin"],
        exact: true,
        isAnonymous: false,
      },
    ],
  },
];

const forumsRoutes = [
  {
    path: "/forums/form",
    name: "Form for Forums",
    exact: true,
    element: ForumsForm,
    roles: ["SysAdmin"],
    isAnonymous: false,
  },
];

const errorRoutes = [
  {
    path: "*",
    name: "Error - 400",
    element: PageNotFound,
    roles: [],
    exact: true,
    isAnonymous: false,
  },
];

const allRoutes = [
  ...candidateRoutes,
  ...candidateDashboardRoutes,
  ...dashboardRoutes,
  ...errorRoutes,
  ...files,,
  ...personalValuesRankingRoutes,
  ...licenseRoutes,
  ...forumsRoutes,
];

export default allRoutes;
