<template>
	<div>
		  <b-tabs content-class="mt-3" justified>
      <b-tab active>
        <template #title>
          <b-icon icon="shop"></b-icon>
          <h5>Orders</h5>
        </template>
        <b-container fluid class="bv-example-row">
          <b-row>
           <b-col
            class="orders-table">
              <vxe-toolbar>
                <template v-slot:buttons>
                  <vxe-input v-model="filterOrdersTable" type="search" placeholder="Search an order"></vxe-input>
                  <vxe-button status="primary" @click="newOrderDialog()" content="Create an order" size="medium"></vxe-button>
                </template>
              </vxe-toolbar>
              <vxe-table
                border
                stripe
                show-header-overflow
                show-overflow
                highlight-hover-row
                :data="filterOrdersTableData">
                <vxe-table-column type="seq" title="S.No." width="100"></vxe-table-column>
                <vxe-table-column field="sex" title="Client Name"></vxe-table-column>
                <vxe-table-column field="age" title="Age"></vxe-table-column>
                <vxe-table-column field="address" title="Address"></vxe-table-column>
                <template v-slot:empty>
                  <span style="color: black;">
                    <p>No data found</p>
                  </span>
                </template>
            </vxe-table>
            
           </b-col>
          </b-row>
        </b-container>
      </b-tab>
      <b-tab >
        <template #title>
          <b-icon icon="shop"></b-icon>
          <h5>Employees</h5>
        </template>
      </b-tab>
      <b-tab >
        <template #title>
          <b-icon icon="shop"></b-icon>
          <h5>Clients</h5>
        </template>
      </b-tab>
      <b-tab >
        <template #title>
          <b-icon icon="shop"></b-icon>
          <h5>Receipts</h5>
        </template>
      </b-tab>
    </b-tabs>
    
	</div>
  
</template>  
<script src="./tab-layout.js"></script>
<style scoped src="./tab-layout.css"></style>