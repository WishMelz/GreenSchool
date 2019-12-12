<template>
  <div class="menuList">
    <!-- 面包屑 -->
    <el-row :span="24">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item :to="{ path: `${this.$route.matched[0].path}` }"
          >首页</el-breadcrumb-item
        >
        <el-breadcrumb-item>
          <a :href="`${this.$route.matched[1].path}`">窗口管理</a>
        </el-breadcrumb-item>
      </el-breadcrumb>
    </el-row>
    <!-- 搜索框  添加框-->
    <el-row>
      <el-col :span="8">
        <div style="margin-top: 15px;">
          <el-input
            placeholder="请输入内容"
            v-model="queryInfo.query"
            class="input-with-select"
            @change="getWin_st"
          >
            <el-button
              slot="append"
              icon="el-icon-search"
              type="primary"
              @click="getWin_st"
            ></el-button>
          </el-input>
        </div>
      </el-col>
    </el-row>
    <!-- table -->
    <el-card>
      <el-row>
        <el-col :span="6">
          <el-button type="primary">窗口管理 ------- win</el-button>
        </el-col>
        <el-col :span="6">
          <el-button type="primary" @click="adddialogVisible = true"
            >添加窗口</el-button
          >
        </el-col>
      </el-row>
      <el-table
        :data="winlist"
        style="width: 100%"
        :row-class-name="tableRowClassName"
      >
        <el-table-column type="index" label="索引"></el-table-column>
        <el-table-column prop="win_name" label="名称"></el-table-column>
        <el-table-column prop="win_inter" label="介绍"></el-table-column>
        <el-table-column prop="win_start" label="开始时间"></el-table-column>
        <el-table-column prop="win_end" label="结束时间"></el-table-column>
        <el-table-column prop="users_id" label="所属人员"></el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scoped">
            <el-button
              type="success"
              size="mini"
              icon="el-icon-edit"
              @click="change_win(scoped.row.id)"
              >修改</el-button
            >
            <el-button
              type="danger"
              size="mini"
              icon="el-icon-delete"
              @click="delete_win(scoped.row.id)"
              >删除</el-button
            >
          </template>
        </el-table-column>
      </el-table>
      <!-- 分页 -->
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="queryInfo.pagenum"
        :page-sizes="[2, 5, 10, 50]"
        :page-size="queryInfo.pagesize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      ></el-pagination>
    </el-card>
    <!--  添加窗口  -->
    <el-dialog
      title="添加窗口"
      :visible.sync="adddialogVisible"
      width="50%"
      :before-close="handleClose"
      @close="handleClose"
      style="background-color:#409EFF;"
    >
      <el-form
        :model="addruleForm"
        :rules="addrules"
        ref="addruleref"
        label-width="140px"
        class="demo-ruleForm"
        label-position="left"
      >
        <el-form-item label="窗口名称" prop="win_name">
          <el-input v-model="addruleForm.win_name"></el-input>
        </el-form-item>
        <el-form-item label="添加的用户的名称" prop="users_id">
          <el-input disabled v-model="addruleForm.users_id"></el-input>
        </el-form-item>
        <el-form-item label="窗口的介绍" prop="win_inter">
          <el-input v-model="addruleForm.win_inter"></el-input>
        </el-form-item>
        <el-form-item label="窗口售卖开始时间" prop="win_start">
          <el-time-picker
            v-model="addruleForm.win_start"
            placeholder="任意时间点"
          ></el-time-picker>
        </el-form-item>
        <el-form-item label="窗口售卖结束时间" prop="win_end">
          <el-time-picker
            v-model="addruleForm.win_end"
            placeholder="任意时间点"
          ></el-time-picker>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="adddialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="add_win">确 定</el-button>
      </span>
    </el-dialog>

    <!-- 修改窗口 -->

    <el-dialog
      title="修改窗口"
      :visible.sync="changedialogVisible"
      width="50%"
      :before-close="changehandleClose"
      @close="changehandleClose"
      style="background-color:#F56C6C;"
    >
      <el-form
        :model="changeruleForm"
        :rules="changerules"
        ref="changeruleref"
        label-width="140px"
        class="demo-ruleForm"
        label-position="left"
      >
        <el-form-item label="窗口名称" prop="win_name">
          <el-input v-model="changeruleForm.win_name"></el-input>
        </el-form-item>
        <el-form-item label="修改的用户的名称" prop="users_id">
          <el-input disabled v-model="changeruleForm.users_id"></el-input>
        </el-form-item>
        <el-form-item label="窗口的介绍" prop="win_inter">
          <el-input v-model="changeruleForm.win_inter"></el-input>
        </el-form-item>
        <el-form-item label="修改窗口售卖当天开始时间" prop="win_start">
          <el-time-picker
            v-model="changeruleForm.win_start"
            placeholder="任意时间点"
          ></el-time-picker>
        </el-form-item>
        <el-form-item label="修改窗口售卖当天结束时间" prop="win_end">
          <el-time-picker
            v-model="changeruleForm.win_end"
            placeholder="任意时间点"
          ></el-time-picker>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="changedialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="changetwo_win">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>
<script>
export default {
  data() {
    return {
      users_id: "",
      queryInfo: {
        pagenum: 1,
        pagesize: 10,
        query: "",
        users_id: ""
      },
      total: 0,
      winlist: [],
      // 添加窗口的弹框
      adddialogVisible: false,
      // 添加窗口的表单
      addruleForm: {
        win_name: "",
        users_id: "1",
        win_inter: "",
        win_start: "",
        win_end: ""
      },
      // 添加窗口的校验
      addrules: {
        win_name: [
          { required: true, message: "请输入窗口名称", trigger: "blur" },
          { min: 1, max: 10, message: "长度在 1 到 10 个字符", trigger: "blur" }
        ],
        users_id: [
          {
            required: true,
            message: "请输入添加的用户的名称",
            trigger: "blur"
          }
        ],
        win_inter: [
          { required: true, message: "请输入窗口的介绍", trigger: "blur" },
          { min: 1, max: 80, message: "长度在 1 到 80 个字符", trigger: "blur" }
        ],
        win_start: [
          { required: true, message: "请输入售卖开始时间", trigger: "blur" }
        ],
        win_end: [
          { required: true, message: "请输入售卖结束时间", trigger: "blur" }
        ]
      },
      // 修改窗口的弹框
      changedialogVisible: false,
      // 修改加窗口的表单
      changeruleForm: {
        win_name: "",
        users_id: "",
        win_inter: "",
        win_start: "",
        win_end: ""
      },
      // 修改窗口的校验
      changerules: {
        win_name: [
          { required: true, message: "请输入修改的窗口名称", trigger: "blur" },
          { min: 1, max: 10, message: "长度在 1 到 10 个字符", trigger: "blur" }
        ],
        users_id: [
          {
            required: true,
            message: "请输入修改的用户的名称",
            trigger: "blur"
          }
        ],
        win_inter: [
          {
            required: true,
            message: "请输入修改的窗口的介绍",
            trigger: "blur"
          },
          { min: 1, max: 80, message: "长度在 1 到 80 个字符", trigger: "blur" }
        ],
        win_start: [
          {
            required: true,
            message: "请输入修改的当天售卖开始时间",
            trigger: "blur"
          }
        ],
        win_end: [
          {
            required: true,
            message: "请输入修改的当天售卖结束时间",
            trigger: "blur"
          }
        ]
      }
    };
  },
  methods: {
    // 关闭修改窗口
    changehandleClose() {
      this.changeruleForm.win_start = "";
      this.changeruleForm.win_end = "";
      this.$refs.changeruleref.resetFields();
      this.changedialogVisible = false;
    },
    // 修改窗口显示
    change_win(id) {
      console.log(id);
      // 通过id 获取到数据
      this.$axios.get(`/win_st_ht/${id}`).then(res => {
        if (res.data.state.code !== "200") {
          return this.$message.error(res.data.state.msg);
        } else {
          // console.log(res.data.data[0]);
          this.$message.success(res.data.state.msg);
          this.changeruleForm = res.data.data[0];
          this.changeruleForm.id = id;
          this.changedialogVisible = true;
        }
      });
    },
    // 修改窗口按钮
    changetwo_win() {
      this.$refs.changeruleref.validate(valid => {
        if (!valid) {
          return this.$message.error("请填写完整的数据");
        } else {
          var time2 = new Date().Format("yyyy-MM-dd");

          this.changeruleForm.win_start = `${time2} ${new Date(
            this.changeruleForm.win_start
          ).Format("HH:mm:ss")}`;
          this.changeruleForm.win_end = `${time2} ${new Date(
            this.changeruleForm.win_end
          ).Format("HH:mm:ss")}`;
          this.$axios
            .put(`/win_st_ht/${this.changeruleForm.id}`, this.changeruleForm)
            .then(res => {
              if (res.data.state.code !== "200") {
                return this.$message.error(res.data.state.msg);
              } else {
                this.$message.success(res.data.state.msg);
                this.changedialogVisible = false;
                this.getWin_st();
              }
            });
        }
      });
    },
    // 关闭添加窗口
    handleClose() {
      this.addruleForm.win_start = "";
      this.addruleForm.win_end = "";
      this.$refs.addruleref.resetFields();
      this.adddialogVisible = false;
    },
    // 添加窗口
    add_win() {
      this.$refs.addruleref.validate(valid => {
        if (!valid) {
          return this.$message.error("请填写完整的数据");
        } else {
          var time2 = new Date().Format("yyyy-MM-dd");
          this.addruleForm.win_start = `${time2} ${this.addruleForm.win_start.Format(
            "HH:mm:ss"
          )}`;
          this.addruleForm.win_end = `${time2} ${this.addruleForm.win_end.Format(
            "HH:mm:ss"
          )}`;
          this.$axios.post("/win_st_ht", this.addruleForm).then(res => {
            // console.log(res.data);
            if (res.data.state.code !== "200") {
              return this.$message.error(res.data.state.msg);
            } else {
              this.$message.success(res.data.state.msg);
              this.getWin_st();
              this.adddialogVisible = false;
            }
          });
        }
      });
    },
    // 删除窗口
    delete_win(id) {
      this.$confirm("此操作将永久删除该文件, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          this.$axios.delete(`/win_st_ht/${id}`).then(res => {
            console.log(res);
            if (res.data.state.code !== "200") {
              return this.$message.error(res.data.state.msg);
            } else {
              this.$message({
                type: "success",
                message: "删除成功!"
              });
              this.getWin_st();
            }
          });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消删除"
          });
        });
    },
    // 获取到窗口数据 /win_st
    async getWin_st() {
      console.log(this.queryInfo);
      let res = await this.$axios.get("/win_st_ht", { params: this.queryInfo });
      this.total = res.data.data[0][0].total;
      this.winlist = res.data.data[1];
      console.log(res);
    },
    // size改变
    handleSizeChange(size) {
      this.queryInfo.pagesize = size;
      this.getWin_st();
    },
    // num改变
    handleCurrentChange(num) {
      this.queryInfo.pagenum = num;
      this.getWin_st();
    },
    // 改变颜色
    tableRowClassName({ rowIndex }) {
      if (rowIndex === 1) {
        return "warning-row";
      } else if (rowIndex === 3) {
        return "success-row";
      }
      return "";
    }
  },
  created() {
    this.queryInfo.users_id = sessionStorage.getItem("_userId") || 1;
    this.getWin_st();
    Date.prototype.Format = function(fmt) {
      var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "H+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        S: this.getMilliseconds() //毫秒
      };
      if (/(y+)/.test(fmt))
        fmt = fmt.replace(
          RegExp.$1,
          (this.getFullYear() + "").substr(4 - RegExp.$1.length)
        );
      for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt))
          fmt = fmt.replace(
            RegExp.$1,
            RegExp.$1.length == 1
              ? o[k]
              : ("00" + o[k]).substr(("" + o[k]).length)
          );
      return fmt;
    };
  }
};
</script>
<style>
.menuList {
  width: 100%;
  height: 100%;
}
.el-card {
  margin: 10px 0px;
}
.el-pagination {
  margin: 10px 0px;
}

.el-table .warning-row {
  background: oldlace;
}

.el-table .success-row {
  background: #f0f9eb;
}
</style>
