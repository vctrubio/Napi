import XEUtils from 'xe-utils'
import NewOrderDialog from '../new-order-dialog/new-order-dialog'
export default{
	name: "tab-layout",
	components: {
		NewOrderDialog
	},
	data: function () {
		return {
		message: "Hello Shubham Jain!",
		filterOrdersTable: '',
		openNewOrderDialog: false,
		formType: '',
		tableData: [
			{ id: 10001, name: 'Test1', role: 'Develop', sex: 'Man', age: 28, address: 'vxe-table' },
			{ id: 10002, name: 'Test2', role: 'Test', sex: 'Women', age: 22, address: 'Guangzhou' },
			{ id: 10003, name: 'Test3', role: 'PM', sex: 'Man', age: 32, address: 'Shanghai' },
			{ id: 10004, name: 'Test4', role: 'Designer', sex: 'Women ', age: 24, address: 'Shanghai' }
		]
		}
	},
	watch: {
    'openNewOrderDialog': function (newVal) {
      if(!newVal){

			}
    }
	},
	methods: {
		newOrderDialog(){
      // this.formType = formType;
      this.openNewOrderDialog = true;
      // if(formType === "edit"){
        
      // }
    }
	},
	computed: {
		filterOrdersTableData () {
			const filterOrdersTable = XEUtils.toString(this.filterOrdersTable).trim().toLowerCase()
			if (filterOrdersTable) {
				const filterRE = new RegExp(filterOrdersTable, 'gi')
				const searchProps = ['sex', 'age', 'address']
				const rest = this.tableData.filter(item => searchProps.some(key => XEUtils.toString(item[key]).toLowerCase().indexOf(filterOrdersTable) > -1))
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