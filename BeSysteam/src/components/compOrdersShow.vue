<template>
  <div>
    <el-tabs v-model="activeName" @tab-click="showTableData">
      <el-tab-pane label="待支付" name="0">
        <el-steps :active="active" finish-status="success">
          <el-step title="待支付"></el-step>
          <el-step title="已支付，待收货"></el-step>
          <el-step title="已发货，待收货"></el-step>
          <el-step title="已收货，待评价"></el-step>
          <el-step title="已完成"></el-step>
        </el-steps>
        <!-- 表格 -->
        <el-table :data="tableData" stripe style="width: 100%">
          <el-table-column prop="order_num" label="订单号"></el-table-column>
          <el-table-column prop="price" label="支付金额"></el-table-column>
          <el-table-column label="支付方式">
            <template slot-scope="scoped">
              <!-- {{ scoped.row.pay_method }} -->
              <el-tag type="info" v-if="scoped.row.pay_method == 0"
                >未支付</el-tag
              >
              <el-tag type="success" v-if="scoped.row.pay_method == 1"
                >微信支付</el-tag
              >
              <el-tag v-if="scoped.row.pay_method == 2">支付宝支付</el-tag>
              <el-tag type="danger" v-if="scoped.row.pay_method == 3"
                >银联支付</el-tag
              >
              <el-tag type="warning" v-if="scoped.row.pay_method == 4"
                >货到付款</el-tag
              >
            </template>
          </el-table-column>
          <el-table-column prop="shr_name" label="收货人姓名"></el-table-column>
          <el-table-column
            prop="shr_mobile"
            label="收货人手机"
          ></el-table-column>
          <el-table-column label="操作">
            <template slot-scope="scoped">
              <el-button type="success" round @click="affirm(scoped.row.id)"
                >确认支付</el-button
              >
            </template>
          </el-table-column>
        </el-table>
      </el-tab-pane>
      <el-tab-pane label="已支付，待收货" name="1">
        <el-steps :active="active" finish-status="success">
          <el-step title="待支付"></el-step>
          <el-step title="已支付，待收货"></el-step>
          <el-step title="已发货，待收货"></el-step>
          <el-step title="已收货，待评价"></el-step>
          <el-step title="已完成"></el-step>
        </el-steps>
        <!-- 表格 -->
        <el-table :data="tableData" stripe style="width: 100%">
          <el-table-column prop="order_num" label="订单号"></el-table-column>
          <el-table-column prop="price" label="支付金额"></el-table-column>
          <el-table-column label="支付方式">
            <template slot-scope="scoped">
              <!-- {{ scoped.row.pay_method }} -->
              <el-tag type="info" v-if="scoped.row.pay_method == 0"
                >未支付</el-tag
              >
              <el-tag type="success" v-if="scoped.row.pay_method == 1"
                >微信支付</el-tag
              >
              <el-tag v-if="scoped.row.pay_method == 2">支付宝支付</el-tag>
              <el-tag type="danger" v-if="scoped.row.pay_method == 3"
                >银联支付</el-tag
              >
              <el-tag type="warning" v-if="scoped.row.pay_method == 4"
                >货到付款</el-tag
              >
            </template>
          </el-table-column>
          <el-table-column prop="shr_name" label="收货人姓名"></el-table-column>
          <el-table-column
            prop="shr_mobile"
            label="收货人手机"
          ></el-table-column>
          <el-table-column label="操作">
            <template slot-scope="scoped">
              <el-button type="success" round @click="affirm(scoped.row.id)"
                >确认发货</el-button
              >
            </template>
          </el-table-column>
        </el-table>
      </el-tab-pane>
      <el-tab-pane label="已发货，待收货" name="2">
        <el-steps :active="active" finish-status="success">
          <el-step title="待支付"></el-step>
          <el-step title="已支付，待收货"></el-step>
          <el-step title="已发货，待收货"></el-step>
          <el-step title="已收货，待评价"></el-step>
          <el-step title="已完成"></el-step>
        </el-steps>
        <!-- 表格 -->
        <el-table :data="tableData" stripe style="width: 100%">
          <el-table-column prop="order_num" label="订单号"></el-table-column>
          <el-table-column prop="price" label="支付金额"></el-table-column>
          <el-table-column label="支付方式">
            <template slot-scope="scoped">
              <!-- {{ scoped.row.pay_method }} -->
              <el-tag type="info" v-if="scoped.row.pay_method == 0"
                >未支付</el-tag
              >
              <el-tag type="success" v-if="scoped.row.pay_method == 1"
                >微信支付</el-tag
              >
              <el-tag v-if="scoped.row.pay_method == 2">支付宝支付</el-tag>
              <el-tag type="danger" v-if="scoped.row.pay_method == 3"
                >银联支付</el-tag
              >
              <el-tag type="warning" v-if="scoped.row.pay_method == 4"
                >货到付款</el-tag
              >
            </template>
          </el-table-column>
          <el-table-column prop="shr_name" label="收货人姓名"></el-table-column>
          <el-table-column
            prop="shr_mobile"
            label="收货人手机"
          ></el-table-column>
          <el-table-column label="操作">
            <template slot-scope="scoped">
              <el-button type="success" round @click="affirm(scoped.row.id)"
                >确认收货</el-button
              >
            </template>
          </el-table-column>
        </el-table>
      </el-tab-pane>
      <el-tab-pane label="已收货，待评价" name="3">
        <el-steps :active="active" finish-status="success">
          <el-step title="待支付"></el-step>
          <el-step title="已支付，待收货"></el-step>
          <el-step title="已发货，待收货"></el-step>
          <el-step title="已收货，待评价"></el-step>
          <el-step title="已完成"></el-step>
        </el-steps>
        <!-- 表格 -->
        <el-table :data="tableData" stripe style="width: 100%">
          <el-table-column prop="order_num" label="订单号"></el-table-column>
          <el-table-column prop="price" label="支付金额"></el-table-column>
          <el-table-column label="支付方式">
            <template slot-scope="scoped">
              <!-- {{ scoped.row.pay_method }} -->
              <el-tag type="info" v-if="scoped.row.pay_method == 0"
                >未支付</el-tag
              >
              <el-tag type="success" v-if="scoped.row.pay_method == 1"
                >微信支付</el-tag
              >
              <el-tag v-if="scoped.row.pay_method == 2">支付宝支付</el-tag>
              <el-tag type="danger" v-if="scoped.row.pay_method == 3"
                >银联支付</el-tag
              >
              <el-tag type="warning" v-if="scoped.row.pay_method == 4"
                >货到付款</el-tag
              >
            </template>
          </el-table-column>
          <el-table-column prop="shr_name" label="收货人姓名"></el-table-column>
          <el-table-column
            prop="shr_mobile"
            label="收货人手机"
          ></el-table-column>
          <el-table-column label="操作">
            <template slot-scope="scoped">
              <el-button type="success" round @click="affirm(scoped.row.id)"
                >确认评论</el-button
              >
            </template>
          </el-table-column>
        </el-table>
      </el-tab-pane>
      <el-tab-pane label="已完成" name="4">
        <el-steps :active="active" finish-status="success">
          <el-step title="待支付"></el-step>
          <el-step title="已支付，待收货"></el-step>
          <el-step title="已发货，待收货"></el-step>
          <el-step title="已收货，待评价"></el-step>
          <el-step title="已完成"></el-step>
        </el-steps>
        <!-- 表格 -->
        <el-table :data="tableData" stripe style="width: 100%">
          <el-table-column prop="order_num" label="订单号"></el-table-column>
          <el-table-column prop="price" label="支付金额"></el-table-column>
          <el-table-column label="支付方式">
            <template slot-scope="scoped">
              <!-- {{ scoped.row.pay_method }} -->
              <el-tag type="info" v-if="scoped.row.pay_method == 0"
                >未支付</el-tag
              >
              <el-tag type="success" v-if="scoped.row.pay_method == 1"
                >微信支付</el-tag
              >
              <el-tag v-if="scoped.row.pay_method == 2">支付宝支付</el-tag>
              <el-tag type="danger" v-if="scoped.row.pay_method == 3"
                >银联支付</el-tag
              >
              <el-tag type="warning" v-if="scoped.row.pay_method == 4"
                >货到付款</el-tag
              >
            </template>
          </el-table-column>
          <el-table-column prop="shr_name" label="收货人姓名"></el-table-column>
          <el-table-column
            prop="shr_mobile"
            label="收货人手机"
          ></el-table-column>
          <el-table-column label="操作">
            <template slot-scope="scoped">
              <el-button type="success" round @click="affirm(scoped.row.id)"
                >确认完成</el-button
              >
            </template>
          </el-table-column>
        </el-table>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>
<script>
export default {
  data() {
    return {
      activeName: "0",
      active: 0,
      tableData: []
    };
  },
  methods: {
    showTableData() {
      //   console.log(1);
      this.active = this.activeName - 0;
      // 获取订单状态
      let state = this.activeName - 0;
      //   获取用户id
      let id = 1;
      this.$axios
        .get(`/showTableData`, {
          params: {
            id: id,
            state: state
          }
        })
        .then(res => {
          //   console.log(res);
          this.tableData = res.data.data;
        });
    },
    affirm(id) {
      this.$axios
        .put(`/affirmState/${id}`, {
          data: { active: `${this.active}` }
        })
        .then(res => {
          console.log(res);
          this.$message.success("更新成功");
          this.active = this.activeName - 0;
          this.showTableData();
        });
    }
  },
  created() {
    this.showTableData();
  }
};
</script>
