import XEUtils from 'xe-utils'
export default {
	name: "clients-layout",
	data(){
		return {
			filterClientsTable: '',
			formType: '',
			openNewClientDialog: false,
			value1: null,
			tableData: [
				{ id: 10001, name: 'Test1', role: 'Develop', sex: 'Man', age: 28, address: 'vxe-table' },
				{ id: 10002, name: 'Test2', role: 'Test', sex: 'Women', age: 22, address: 'Guangzhou' },
				{ id: 10003, name: 'Test3', role: 'PM', sex: 'Man', age: 32, address: 'Shanghai' },
				{ id: 10004, name: 'Test4', role: 'Designer', sex: 'Women ', age: 24, address: 'Shanghai' }
			]
		}
	},
	watch: {
    
	},
	methods: {
		newClientModal(){
      // this.formType = formType;
      this.openNewClientDialog = true;
      // if(formType === "edit"){
        
      // }
		},
		formatRole ({ cellValue }) {
			return `<a href="https://github.com/x-extends/vxe-table" class="link" target="_black" style="color: black">${cellValue}</a>`
		},
	},
	computed: {
		filterClientsTableData () {
			const filterClientsTable = XEUtils.toString(this.filterClientsTable).trim().toLowerCase()
			if (filterClientsTable) {
				const filterRE = new RegExp(filterClientsTable, 'gi')
				const searchProps = ['sex', 'age', 'address']
				const rest = this.tableData.filter(item => searchProps.some(key => XEUtils.toString(item[key]).toLowerCase().indexOf(filterClientsTable) > -1))
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