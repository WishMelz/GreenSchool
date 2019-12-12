import Vue from "vue";
import VueRouter from "vue-router";
import Index from "../views/Index.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    redirect: "/index"
  },
  {
    path: "/index",
    name: "Index",
    component: Index,
    children: [
      // 后台列表管理
      {
        path: "/index",
        redirect: "/wel"
      },
      {
        path: "/wel",
        component: () => import("../components/Welcome.vue")
      },
      {
        path: "/userList",
        component: () => import("../components/userList.vue")
      },
      {
        path: "/shop",
        component: () => import("../components/compShop.vue")
      },
      {
        path: "/esclassfiy",
        component: () => import("../components/compEsclassfiy.vue")
      },
      {
        path: "/ordersShow",
        component: () => import("../components/compOrdersShow.vue")
      },
      {
        path: "/menuList",
        component: () => import("../components/compMenuList.vue")
      },
      {
        path: "/menuClassify",
        component: () => import("../components/compMenuClassify.vue")
      },
      {
        path: "/winList",
        component: () => import("../components/compWinList.vue")
      },
      {
        path: "/invitation",
        component: () => import("../components/compInvitation.vue")
      },
      {
        path: "/ShopOrder",
        component: () => import("../components/compShopOrder.vue")
      }
    ]
  },
  {
    path: "/login",
    name: "login",
    component: () => import("../views/login.vue")
  }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});
// 路由导航守卫
router.beforeEach((to, from, next) => {
  // 判断是否是login这个路由是这个路由放行
  if (to.path == "/login") return next();

  // 获取有没有令牌 如果没有令牌 去login
  const token = window.sessionStorage.getItem("_token");
  const qxId = window.sessionStorage.getItem("_qxId");
  if (!token) {
    window.sessionStorage.removeItem("_token");
    return next("/login");
  }
  if (qxId == 1) return next();
  let path = to.path;
  if (path == "/wel") return next();
  if (path != "/menuList" && qxId != 1) {
    next("/");
  }
  // 如果登录了 那么就放行
  next();
});
export default router;
