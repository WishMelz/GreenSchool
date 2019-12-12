<template>
  <div class="reports">
    <!-- 面包屑导航 -->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>商品订单</el-breadcrumb-item>
      <el-breadcrumb-item>订单走势</el-breadcrumb-item>
    </el-breadcrumb>
    <!-- 卡片 -->
    <el-card>
      <el-radio-group v-model="radio1" @change="btn">
        <el-radio-button label="今日"></el-radio-button>
        <el-radio-button label="近三日"></el-radio-button>
        <el-radio-button label="近七日"></el-radio-button>
        <el-radio-button label="近一月"></el-radio-button>
      </el-radio-group>
      <div id="main" ref="main" style="width: 100%;height:400px;"></div>
    </el-card>
  </div>
</template>

<script>
import echarts from "echarts";
export default {
  data() {
    return {
      radio1: "近三日",
      msg: "Welcome to Your Vue.js App",
      how: 3,
      start: "",
      end: "",
      week: [],
      //多少天前零点的时间戳
      ThreeDayAgo: 0,
      //柱状图数据
      list: []
    };
  },
  mounted() {
    this.drawLine();
    this.showhow();
  },
  methods: {
    drawLine() {
      var myChart = echarts.init(this.$refs.main);
      //   console.log(myChart);
      // 指定图表的配置项和数据
      var option = {
        title: {
          text: "订单走势"
        },
        tooltip: {},
        legend: {},
        xAxis: {
          data: this.week
        },
        yAxis: {},
        series: [
          {
            type: "bar",
            data: this.list
          }
        ]
      };
      // 使用刚指定的配置项和数据显示图表。
      myChart.setOption(option);
    },
    // 点击按钮
    btn(num) {
      if (num === "今日") {
        this.how = 1;
        this.showhow();
      } else if (num === "近三日") {
        this.how = 3;
        this.showhow();
      } else if (num === "近七日") {
        this.how = 7;
        this.showhow();
        //获取最近7天日期
      } else if (num === "近一月") {
        this.how = 30;
        this.showhow();
      } else {
        this.how = 3;
        this.showhow();
      }
    },
    // 获取当前时间，day为number，getDay(-1),表示昨天的日期
    getDay(day) {
      var today = new Date();
      var targetday_milliseconds = today.getTime() + 1000 * 60 * 60 * 24 * day;
      today.setTime(targetday_milliseconds); //注意，这行是关键代码
      var tYear = today.getFullYear();
      var tMonth = today.getMonth();
      var tDate = today.getDate();
      tMonth = this.doHandleMonth(tMonth + 1);
      tDate = this.doHandleMonth(tDate);
      return tYear + "-" + tMonth + "-" + tDate;
    },
    doHandleMonth(month) {
      var m = month;
      if (month.toString().length == 1) {
        m = "0" + month;
      }
      return m;
    },
    // 显示多少天
    showhow() {
      let data = [];
      this.end = this.getDay();
      let i = this.how - 1;
      for (i; i >= 0; i--) {
        data.push(this.getDay(-i));
      }
      //   获取多少天
      this.week = data;
      //   console.log(this.week);
      //   获取多少天前零点的时间戳
      var time = new Date().setHours(0, 0, 0, 0);
      this.ThreeDayAgo = (time - 86400000 * (this.how - 1)) / 1000;
      //调用eacharts
      this.drawLine();
      //调用发起请求
      this.gainquantity();
    },
    // 获取数据
    async gainquantity() {
      const { data: res } = await this.$axios.get("/showtime", {
        params: this.ThreeDayAgo
      });
      var arr = [];
      if (res.data.length < this.how) {
        let num = this.how - res.data.length;
        for (var i = 0; i < num; i++) {
          arr.unshift(0);
        }
      }
      var arr3 = arr.concat(res.data);
      this.list = arr3;
      this.drawLine();
    }
  }
};
</script>

<style>
#myChart {
  width: 100%;
  height: 500px;
}

.el-breadcrumb {
  margin-bottom: 30px;
}
</style>
