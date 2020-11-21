import XEUtils from 'xe-utils'
import axios from 'axios'
export default {
	name: "employees-layout",
	data(){
		return{
			filterEmployeesTable: '',
			formType: '',
			openNewEmployeeDialog: false,
			tableData: []
		}
	},
	watch: {
    
	},
	created(){
		this.initialize();
	},
	methods: {
		newEmployeeModal(){
      // this.formType = formType;
      this.openNewEmployeeDialog = true;
      // if(formType === "edit"){
        
      // }
		},
		initialize() {
      return axios
        .get(`http://localhost:3000/api/employees`)
        .then(response => {
           this.tableData = response.data.data;
         })
        .catch(e => {
           console.log(e);
        });
    },
		formatRole ({ cellValue }) {
			return `<a href="https://github.com/x-extends/vxe-table" class="link" target="_black" style="color: black">${cellValue}</a>`
		},
	},
	computed: {
		filterEmployeesTableData () {
			const filterEmployeesTable = XEUtils.toString(this.filterEmployeesTable).trim().toLowerCase()
			if (filterEmployeesTable) {
				const filterRE = new RegExp(filterEmployeesTable, 'gi')
				const searchProps = ['name', 'phone']
				const rest = this.tableData.filter(item => searchProps.some(key => XEUtils.toString(item[key]).toLowerCase().indexOf(filterEmployeesTable) > -1))
				return rest.map(row => {
					const item = Object.assign({}, row)
					searchProps.forEach(key => {
						item[key] = XEUtils.toString(item[key]).replace(filterRE, match => `${match}`)
					})
					return item
				})
			}
			return this.tableData
		}
	}
}