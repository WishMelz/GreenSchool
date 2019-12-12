<template>
  <div class="menuList">
    <!-- 面包屑 -->
    <el-row :span="24">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item :to="{ path: `${this.$route.matched[0].path}` }"
          >首页</el-breadcrumb-item
        >
        <el-breadcrumb-item>
          <a :href="`${this.$route.matched[1].path}`">菜品管理</a>
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
            @change="getMenu_st"
          >
            <el-button
              slot="append"
              icon="el-icon-search"
              type="primary"
              @click="getMenu_st"
            ></el-button>
          </el-input>
        </div>
      </el-col>
    </el-row>
    <!-- table -->
    <el-card>
      <el-row>
        <el-col :span="6">
          <el-button type="primary">菜品管理 ------- menu</el-button>
        </el-col>
        <el-col :span="6">
          <el-button type="primary" @click="adddialogVisible = true"
            >添加菜品</el-button
          >
        </el-col>
        <el-col :span="6">
          <el-select
            v-model="queryInfo.win_id"
            @change="getMenu_st"
            placeholder="请选择窗口列表"
          >
            <el-option
              v-for="item in winlist"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            ></el-option>
          </el-select>
        </el-col>
        <el-col :span="6">
          <el-select
            v-model="queryInfo.classify_id"
            @change="getMenu_st"
            placeholder="请选择分类列表"
          >
            <el-option
              v-for="item in classifylist"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            ></el-option>
          </el-select>
        </el-col>
      </el-row>
      <el-table
        :data="menulist"
        style="width: 100%"
        :row-class-name="tableRowClassName"
      >
        <el-table-column type="index" label="索引"></el-table-column>
        <el-table-column prop="menu_name" label="菜品名称"></el-table-column>
        <el-table-column prop="menu_img" label="菜品图片" width="130">
          <template slot-scope="scoped">
            <el-image
              style="width: 100px; height: 100px"
              :src="scoped.row.menu_img"
              fit="['fill', 'contain', 'cover', 'none', 'scale-down']"
            ></el-image>
          </template>
        </el-table-column>
        <el-table-column prop="menu_price" label="菜品价格"></el-table-column>
        <el-table-column prop="menu_unit" label="菜品分量"></el-table-column>
        <el-table-column prop="recommend" label="推荐状态">
          <template slot-scope="scoped">
            <el-button type="primary" v-if="scoped.row.recommend == 0"
              >推荐</el-button
            >
            <el-button type="danger" v-if="scoped.row.recommend == 1"
              >不推荐</el-button
            >
          </template>
        </el-table-column>
        <el-table-column prop="classify_name" label="分类"></el-table-column>
        <el-table-column prop="win_name" label="所属菜馆"></el-table-column>
        <el-table-column prop="users_id" label="所属人员"></el-table-column>
        <el-table-column label="操作" width="200">
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
              @click="delete_win(scoped.row.id, scoped.row.win_menu_id)"
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
    <!--  添加菜品  -->
    <el-dialog
      title="添加菜品"
      :visible.sync="adddialogVisible"
      width="70%"
      :before-close="handleClose"
      @close="handleClose"
      style="background-color:#409EFF;"
    >
      <el-form
        :model="addruleForm"
        :rules="addrules"
        ref="addruleref"
        label-width="240px"
        class="demo-ruleForm"
        label-position="left"
      >
        <el-form-item label="菜品名称" prop="menu_name">
          <el-input v-model="addruleForm.menu_name"></el-input>
        </el-form-item>
        <el-form-item label="菜品描述" prop="menu_describe">
          <el-input v-model="addruleForm.menu_describe"></el-input>
        </el-form-item>
        <el-form-item label="菜品价格（数字 单位为元）" prop="menu_price">
          <el-input v-model="addruleForm.menu_price"></el-input>
        </el-form-item>
        <el-form-item label="菜品分量（列如 20元/份 ）" prop="menu_unit">
          <el-input v-model="addruleForm.menu_unit"></el-input>
        </el-form-item>
        <el-form-item label="菜品图片" prop="menu_img">
          <el-upload
            :action="action"
            list-type="picture-card"
            :on-preview="handlePictureCardPreview"
            :on-remove="handleRemove"
            :on-success="handsuccess"
          >
            <i class="el-icon-plus"></i>
          </el-upload>
          <el-dialog :visible.sync="dialogVisible">
            <img width="100%" :src="dialogImageUrl" alt />
          </el-dialog>
        </el-form-item>
        <el-form-item label="是否推荐" prop="recommend">
          <el-button
            @click="addruleForm.recommend = 0"
            type="primary"
            v-if="addruleForm.recommend == 1"
            >不推荐</el-button
          >
          <el-button
            @click="addruleForm.recommend = 1"
            type="danger"
            v-if="addruleForm.recommend == 0"
            >推荐</el-button
          >
        </el-form-item>
        <el-form-item label="所属窗口" prop="win_id">
          <el-radio
            v-model="addruleForm.win_id"
            :label="index"
            v-for="(item, index) in winlist"
            :key="index"
            >{{ item.label }}</el-radio
          >
        </el-form-item>
        <el-form-item label="所属分类" prop="stclassify_id">
          <el-radio
            v-model="addruleForm.stclassify_id"
            :label="index"
            v-for="(item, index) in classifylist"
            :key="index"
            >{{ item.label }}</el-radio
          >
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
      action: "http://47.104.29.236:9999/api/v1/upload_phone",
      // action:"http://127.0.0.1:9999/api/v1/upload_phone",

      // 添加的图片
      dialogImageUrl: "",
      dialogVisible: false,
      menulist: [],
      users_id: "",
      queryInfo: {
        pagenum: 1,
        pagesize: 10,
        query: "",
        users_id: sessionStorage.getItem("_userID") || 1,
        win_id: "",
        classify_id: ""
      },
      total: 0,
      // 分类下拉框数据
      classifyValue: "",
      // 分类下拉框数据
      classifylist: [
        {
          key: "",
          label: "所有",
          value: ""
        }
      ],
      // 窗口下拉框数据

      winlist: [
        {
          key: "",
          label: "所有",
          value: ""
        }
      ],

      // 添加窗口的弹框
      adddialogVisible: false,
      // 添加窗口的表单
      addruleForm: {
        menu_name: "",
        menu_describe: "",
        menu_price: "",
        menu_unit: "",
        menu_img: "",
        recommend: "0",
        win_id: "",
        stclassify_id: "",
        users_id: window.sessionStorage.getItem("_userID") || 1
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
    // 图片上传
    handleRemove(file, fileList) {
      console.log(file, fileList);
    },
    handlePictureCardPreview(file) {
      this.dialogImageUrl = file.url;
      this.dialogVisible = true;
    },
    // 上传oss成功
    handsuccess(response) {
      console.log(response.info);
      this.addruleForm.menu_img = response.info;
      console.log(this.addruleForm);
    },
    // 获取到分类
    async getclassify() {
      let res = await this.$axios.get("/classify_st_ht", {
        params: { users_id: this.queryInfo.queryInfo }
      });
      let arr = [];
      res.data.data[1].forEach(itme => {
        if (arr.indexOf(itme.stclassify_id) == -1) {
          arr.push(itme.stclassify_id);
          this.classifylist.push({
            key: itme.stclassify_id,
            label: itme.name,
            value: itme.stclassify_id
          });
        }
      });
    },
    // 获取到窗口
    async getwin() {
      let res = await this.$axios.get("/win_st_ht", {
        params: { users_id: this.queryInfo.queryInfo }
      });
      let arr = [];
      res.data.data[1].forEach(itme => {
        if (arr.indexOf(itme.id) == -1) {
          arr.push(itme.id);
          this.winlist.push({
            key: itme.id,
            label: itme.win_name,
            value: itme.id
          });
        }
      });
    },
    // 关闭修改窗口
    changehandleClose() {
      this.$refs.changeruleref.resetFields();
      this.changedialogVisible = false;
    },
    // 修改窗口显示
    change_win(id) {
      console.log(id);
      // this.changedialogVisible = true;
      this.$message.error("改个屁，给我删了，再添");
      // // 通过id 获取到数据
      // this.$axios.get(`/win_st_ht/${id}`).then(res => {
      //   if (res.data.state.code !== "200") {
      //     return this.$message.error(res.data.state.msg);
      //   } else {
      //     this.$message.success(res.data.state.msg);
      //     this.changeruleForm = res.data.data[0];
      //     this.changeruleForm.id = id;
      //     this.changedialogVisible = true;
      //   }
      // });
    },
    // 修改窗口按钮
    changetwo_win() {
      // this.$refs.changeruleref.validate(valid => {
      //   if (!valid) {
      //     return this.$message.error("请填写完整的数据");
      //   } else {
      //     var time2 = new Date().Format("yyyy-MM-dd");
      //     this.changeruleForm.win_start = `${time2} ${new Date(
      //       this.changeruleForm.win_start
      //     ).Format("HH:mm:ss")}`;
      //     this.changeruleForm.win_end = `${time2} ${new Date(
      //       this.changeruleForm.win_end
      //     ).Format("HH:mm:ss")}`;
      //     this.$axios
      //       .put(`/win_st_ht/${this.changeruleForm.id}`, this.changeruleForm)
      //       .then(res => {
      //         if (res.data.state.code !== "200") {
      //           return this.$message.error(res.data.state.msg);
      //         } else {
      //           this.$message.success(res.data.state.msg);
      //           this.changedialogVisible = false;
      //           this.getMenu_st();
      //         }
      //       });
      //   }
      // });
    },
    // 关闭添加窗口
    handleClose() {
      this.$refs.addruleref.resetFields();
      this.adddialogVisible = false;
    },
    // 添加菜品数据 和 中间表
    add_win() {
      this.$refs.addruleref.validate(valid => {
        if (!valid) {
          return this.$message.error("请填写完整的数据");
        } else {
          this.$axios.post("/menu_st_ht", this.addruleForm).then(res => {
            if (res.data.state.code !== "200") {
              return this.$message.error(res.data.state.msg);
            } else {
              this.addruleForm.menu_id = res.data.data.insertId;
              // console.log(this.addruleForm);
              this.$axios
                .post("/win_menu_st_ht", this.addruleForm)
                .then(res1 => {
                  if (res1.data.state.code !== "200") {
                    return this.$message.error(res1.data.state.msg);
                  } else {
                    this.$message.success(res1.data.state.msg);
                    this.$message.success(res.data.state.msg);
                    this.getMenu_st();
                    this.adddialogVisible = false;
                  }
                });
            }
          });
        }
      });
    },
    // 删除窗口
    delete_win(id, win_menu_id) {
      this.$confirm("此操作将永久删除该文件, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          this.$axios
            .delete(`/win_menu_id/${id}`, {
              data: { win_menu_id: win_menu_id }
            })
            .then(res => {
              if (res.data.state.code !== "200") {
                return this.$message.error(res.data.state.msg);
              } else {
                this.$message({
                  type: "success",
                  message: "删除成功!"
                });
                this.getMenu_st();
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
    // 获取到菜品数据 /menu_st_ht
    async getMenu_st() {
      let res = await this.$axios.get("/menu_st_ht", {
        params: this.queryInfo
      });
      this.total = res.data.data[0][0].total;
      this.menulist = res.data.data[1];
    },
    // size改变
    handleSizeChange(size) {
      this.queryInfo.pagesize = size;
      this.getMenu_st();
    },
    // num改变
    handleCurrentChange(num) {
      this.queryInfo.pagenum = num;
      this.getMenu_st();
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
    this.getMenu_st();
    this.getclassify();
    this.getwin();
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
