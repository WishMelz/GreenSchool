<template>
  <div class="menuList">
    <!-- 面包屑 -->
    <el-row :span="24">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item :to="{ path: `${this.$route.matched[0].path}` }"
          >首页</el-breadcrumb-item
        >
        <el-breadcrumb-item>
          <a :href="`${this.$route.matched[1].path}`">菜品分类</a>
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
            @change="getclassify_st"
          >
            <el-button
              slot="append"
              icon="el-icon-search"
              type="primary"
              @click="getclassify_st"
            ></el-button>
          </el-input>
        </div>
      </el-col>
    </el-row>
    <!-- table -->
    <el-card>
      <el-row>
        <el-col :span="6">
          <el-button type="primary">分类管理 ------- classify</el-button>
        </el-col>
        <el-col :span="6">
          <el-button type="primary" @click="adddialogVisible = true"
            >添加分类</el-button
          >
        </el-col>
      </el-row>
      <el-table
        :data="classifylist"
        style="width: 100%"
        :row-class-name="tableRowClassName"
      >
        <el-table-column type="index" label="索引"></el-table-column>
        <el-table-column
          prop="stclassify_id"
          label="stclassify_id"
        ></el-table-column>
        <el-table-column prop="name" label="分类名称"></el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scoped">
            <el-button
              type="success"
              size="mini"
              icon="el-icon-edit"
              @click="change_classify(scoped.row.id)"
              >修改</el-button
            >
            <el-button
              type="danger"
              size="mini"
              icon="el-icon-delete"
              @click="delete_classify(scoped.row.id)"
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
        <el-form-item label="分类名称" prop="name">
          <el-input v-model="addruleForm.name"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="adddialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="add_classify">确 定</el-button>
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
        <el-form-item label="菜品分类名称" prop="name">
          <el-input v-model="changeruleForm.name"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="changedialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="changetwo_classify">确 定</el-button>
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
        query: ""
      },
      total: 0,
      classifylist: [],
      // 添加窗口的弹框
      adddialogVisible: false,
      // 添加窗口的表单
      addruleForm: {
        name: ""
      },
      // 添加窗口的校验
      addrules: {
        name: [
          { required: true, message: "请输入菜品分类名称", trigger: "blur" },
          { min: 1, max: 10, message: "长度在 1 到 10 个字符", trigger: "blur" }
        ]
      },
      // 修改窗口的弹框
      changedialogVisible: false,
      // 修改加窗口的表单
      changeruleForm: {
        name: ""
      },
      // 修改窗口的校验
      changerules: {
        name: [
          {
            required: true,
            message: "请输入修改的菜品分类名称",
            trigger: "blur"
          },
          { min: 1, max: 10, message: "长度在 1 到 10 个字符", trigger: "blur" }
        ]
      }
    };
  },
  methods: {
    // 关闭修改窗口
    changehandleClose() {
      this.$refs.changeruleref.resetFields();
      this.changedialogVisible = false;
    },
    // 修改窗口显示
    change_classify(id) {
      console.log(id);
      // 通过id 获取到数据
      this.$axios.get(`/classify_st_ht/${id}`).then(res => {
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
    changetwo_classify() {
      this.$refs.changeruleref.validate(valid => {
        if (!valid) {
          return this.$message.error("请填写完整的数据");
        } else {
          this.$axios
            .put(
              `/classify_st_ht/${this.changeruleForm.id}`,
              this.changeruleForm
            )
            .then(res => {
              if (res.data.state.code !== "200") {
                return this.$message.error(res.data.state.msg);
              } else {
                this.$message.success(res.data.state.msg);
                this.changedialogVisible = false;
                this.getclassify_st();
              }
            });
        }
      });
    },
    // 关闭添加窗口
    handleClose() {
      this.$refs.addruleref.resetFields();
      this.adddialogVisible = false;
    },
    // 添加窗口
    add_classify() {
      this.$refs.addruleref.validate(valid => {
        if (!valid) {
          return this.$message.error("请填写完整的数据");
        } else {
          this.$axios.post("/classify_st_ht", this.addruleForm).then(res => {
            // console.log(res.data);
            if (res.data.state.code !== "200") {
              return this.$message.error(res.data.state.msg);
            } else {
              this.$message.success(res.data.state.msg);
              this.getclassify_st();
              this.adddialogVisible = false;
            }
          });
        }
      });
    },
    // 删除窗口
    delete_classify(id) {
      this.$confirm("此操作将永久删除该文件, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          this.$axios.delete(`/classify_st_ht/${id}`).then(res => {
            console.log(res);
            if (res.data.state.code !== "200") {
              return this.$message.error(res.data.state.msg);
            } else {
              this.$message({
                type: "success",
                message: "删除成功!"
              });
              this.getclassify_st();
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
    // 获取到分类数据 /classify_st_ht
    async getclassify_st() {
      let res = await this.$axios.get("/classify_st_ht", {
        params: this.queryInfo
      });
      this.total = res.data.data[0].length;
      this.classifylist = res.data.data[1];
      console.log(res);
    },
    // size改变
    handleSizeChange(size) {
      this.queryInfo.pagesize = size;
      this.getclassify_st();
    },
    // num改变
    handleCurrentChange(num) {
      this.queryInfo.pagenum = num;
      this.getclassify_st();
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
    this.getclassify_st();
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
