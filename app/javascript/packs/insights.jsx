import React from "react"
import ReactDOM from "react-dom"
import InsightMain from "../components/insights/Main"

decument.addEventListener("DOMContentLoaded", () => {
	ReactDOM.render(
		<InsightsMain {...window.InitialProps} />,
		document.getElementById("insights"),
	)
})