<template>
  <div class="mack">
    <div class="loading" v-loading="loading"
    element-loading-text="正在登陆中，请稍后......"
    element-loading-spinner="el-icon-loading"
    element-loading-background="rgba(0, 0, 0, 0.8)"
    ></div>
    <div class="login">
      <span class="title">用户登录</span>
      <el-row>
        <el-col :span="8">
          <div class="grid-content bg-purple-light">
            <el-form ref="form" :model="form" label-width="80px" :rules="rules">
              <el-form-item label="用户名" prop="username">
                <el-input v-model="form.username"></el-input>
              </el-form-item>
              <el-form-item label="密码" prop="password">
                <el-input type="password" v-model="form.password"></el-input>
              </el-form-item>
            </el-form>
          </div>
        </el-col>
        <el-col class="btn">
        <el-button @click="login"  type="primary">登录</el-button>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      form: {
        username: "myiszz",
        password: "123456"
      },
      rules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" }
        ],
        password: [{ required: true, message: "请输入密码", trigger: "blur" }]
      },
      loading:false
    };
  },
  methods:{
    login(){
       this.$refs['form'].validate((valid) => {
          if (!valid) {
            return
          } else {
            this.loading = true;
            this.$axios.post('/Belogin',this.form).then(res=>{
              this.loading = false;
              if(res.data.code != 200){
                this.$message.error(res.data.msg)
              }else {
                this.$message.success('登录成功')
                sessionStorage.setItem("_token",res.data.token)
                sessionStorage.setItem("_userId",res.data.userId)
                sessionStorage.setItem("_qxId",res.data.qxId)
                this.$router.push("/")
              }
            })
            return false;
          }
        });
      
    }
  }
  
};
</script>

<style>
.mack {
  position: relative;
  width: 100%;
  height: 100%;
  overflow: hidden;
  background: url(../assets/timg.jpeg) no-repeat;
  background-size: 100%;
}
.mack .loading {
  position: absolute;
  width: 100%;
  height: 100%;
}
.login {
  width: 300px;
  margin: 100px auto;
  padding: 30px;
  /* border: 1px solid rgb(226, 107, 89); */
  background: #fff;
  border-radius: 5px;
}
.login .el-col-8 {
  width: 100%;
}
.login .title {
  display: block;
  text-align: center;
  margin-bottom: 20px;
  font-size: 18px;
}
.login .btn {
  text-align: right;
  /* padding-right: 10px; */
}
</style>