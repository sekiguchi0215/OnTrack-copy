import React from "react"
import PropTypes from "prop-types"
import Chart from "chart.js";
import { Reports } from "../../api/main"
import { Alerts } from "../../helper/main"
import { Numerics } from "../../helper/main"

class Year extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			year: this.props.availableYears[this.props.availableYears.length - 1],
			chartData: {
				labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
				datasets: [];
			},
		};
	}

	componentDidMount() {
		this.loadData();
		Chart.defaults.global.animation.duration = 100;
		Chart.defaults.scale.ticks.padding = 10;
		Chart.Legend.prototype.afterFit = function() { this.height = this.height = 20; };
	}

	handleYearChange = (e) => { this.setState({ year: e.target.value }, this.loadDate); }
	loadData = () => {
		Reports.year({ year: this.state.year }).then(
			(resp) => {
				let datasets = [];
				resp.categories.forEach((category) => {

					let dataPoints = [];
					this.state.chartData.labels.forEach((mon) => {
						const spendForCategoryAndMonth = resp.results.find((monthData) => { return monthData.month == mon && monthData.category == category.name });
						dataPoints.push(spendForCategoryAndMonth ? spendForCategoryAndMonth.amount : 0)
					});

					datasets.push({ label: category.name, data: dataPoints, backgroundColor: category.color });
				})
			},
			(error) => { Alerts.genericError(); },
		)
	}

	buildChart() {
		
	}
}






















