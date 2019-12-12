<template>
  <div class="app">
    <el-container>
      <el-header class="appHead">
        <img class="logo" src="../assets/logo.jpg" alt="">
        <h2 class="title">删的库中库，方为猿上猿🇨🇳🇨🇳</h2>
      </el-header>
      <el-container>
        <el-aside width="200px">
          <el-menu
            background-color="#545c64"
            text-color="#fff"
            active-text-color="#ffd04b"
            :router="true"
            :unique-opened="true"
          >
            <el-submenu :index="v.name" v-for="(v, i) in userList" :key="i">
              <template slot="title">
                <i class="el-icon-s-unfold"></i>
                {{ v.name }}
              </template>
              <el-menu-item :index="v1.router" v-for="(v1, i1) in v.childs" :key="i1">
                <i class="el-icon-s-promotion"></i>
                {{ v1.names }}
              </el-menu-item>
            </el-submenu>
          </el-menu>
        </el-aside>
        <el-main>
          <router-view></router-view>
        </el-main>
      </el-container>
    </el-container>
    <child @getUserList="getUserList"></child>
  </div>
</template>
<script>
import child from "../components/userList";
export default {
  data() {
    return {
      userList: []
    };
  },
  components: {
    child
  },

  methods: {
    getUserList() {
      let token = sessionStorage.getItem("_token");
      this.$axios.post("/setUserList", { token }).then(res => {
        console.log(1);
        this.userList = res.data.data;
      });
    }
  },
  created() {
    this.getUserList();
  }
};
</script>
<style>
.el-submenu {
  width: 200px;
  user-select: none;
}
.appHead {
  background: #565c639e;
    color: #fff;
    padding-left: 40px;
}
.app,
.el-container {
  height: 100%;
}
.app .el-aside {
  background: rgb(86, 92, 99);
}
.app .title {
  margin: 0;
  padding: 0;
  padding-top: 15px;
  padding-left: 80px;
  /* background: #ccc; */
}
.app .logo {
  float: left;
  width: 70px;
  height: 60px;
}
/* .el-header {
  padding-top: 15px;
} */
</style>
