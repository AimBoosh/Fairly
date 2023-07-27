import { lazy } from "react";

const Landing = lazy(() => import("../pages/landing/Landing"));
const PageNotFound = lazy(() => import("../components/errors/Error404"));
const SignUp = lazy(() => import("../components/users/SignUp"));
const SignIn = lazy(() => import("../components/users/SignIn"));
const FileUploadExample = lazy(() =>
  import("../components/fileupload/FileUploadExample")
);

const routes = [
  {
    path: "/",
    name: "Landing",
    exact: true,
    element: Landing,
    roles: [],
    isAnonymous: true,
  },
  {
    path: "/fileComponent",
    name: "files",
    element: FileUploadExample,
    roles: [],
    exact: true,
    isAnonymous: true,
  },
 
  {
    path: "/auth/signup",
    name: "SignUp",
    exact: true,
    element: SignUp,
    roles: [],
    isAnonymous: true,
  },
  {
    path: "/auth/signin",
    name: "SignIn",
    exact: true,
    element: SignIn,
    roles: [],
    isAnonymous: true,
  },
];

const errorRoutes = [
  {
    path: "*",
    name: "Error - 400",
    element: PageNotFound,
    roles: [],
    exact: true,
    isAnonymous: true,
  },
];

let allRoutes = [
  ...routes,
  ...errorRoutes,
];

export default allRoutes;
