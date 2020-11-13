export default{
  name: "new-order-dialog",
  props: {
    open: {
      type: Boolean,
      required: true,
      default: false
    },
    formType: ''
  },
  data() {
    return {
      openNewOrderDialog: false,
      form: {
        name: '',
        region: '',
        date1: '',
        date2: '',
        delivery: false,
        type: [],
        resource: '',
        desc: ''
      },
      formLabelWidth: '120px'
    }
  },
  watch: {
    open(value) {
      this.openNewOrderDialog = value;
      if (this.formType === "add") {
        
      }
      if (this.formType === "edit") {
        
      }
    }
  },
  computed: {
    dialogTitle() {
      return this.formType ? this.formType === 'add' ? "Add new Order" : "Edit order" : '';
    },
  },
  methods: {

  }

}