<template>
	<div>
		  <b-tabs content-class="mt-3" justified>
      <b-tab active>
        <template #title>
          <b-icon icon="shop"></b-icon>
          <h5>Orders</h5>
        </template>
        <OrdersLayout />
      </b-tab>
      <b-tab >
        <template #title>
          <b-icon icon="shop"></b-icon>
          <h5>Employees</h5>
        </template>
        <EmployeesLayout />
      </b-tab>
      <b-tab >
        <template #title>
          <b-icon icon="shop"></b-icon>
          <h5>Clients</h5>
        </template>
        <ClientsLayout />
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