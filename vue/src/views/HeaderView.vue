<template>
    <div class="header">
      <div class="logo"><img src="../assets/img/Logo.png" alt="Missing file"></div>
      <div class="brand">
        <h1>Hall's Creek Tree Farm</h1>
      </div>
      <div class="nav">
        <router-link v-bind:to="{ name: 'home' }" class="nav-link">HOME</router-link>
        <div class="spacer"></div>
        <router-link v-bind:to="{ name: 'trees' }" class="nav-link">TREES</router-link>
        <div class="spacer"></div>
        <router-link v-bind:to="{ name: 'home' }" class="nav-link">ABOUT US</router-link>
        <div class="spacer"></div>
        <router-link v-bind:to="{ name: 'login' }" v-if="!$store.state.token" class="nav-link">LOGIN</router-link>
        <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token" class="nav-link">LOGOUT</router-link>
        <div class="spacer"></div>
        <router-link v-bind:to="{ name: 'admin' }" v-if="showAdmin" class="nav-link">ADMIN</router-link>
      </div>

    </div>
</template>
  
<script>
export default {
  data() {
    return {
      showAdmin: false,
    }
  },
  created() {
    if (this.$store.state.user.id == 3 || this.$store.state.user.id == 4) {
      this.showAdmin = true;
    } else {
      this.showAdmin = false;
    }
  },
}
</script>

<style scoped>
.header {
  display: flex;
  flex-direction: row;
  justify-content:space-between;
  padding: 1px;
  height: 15rem;
}
.logo {
  width: 150px;
  height: 150px;
}
img {
  width: 150px;
  height: 150px;
}
.brand {
  justify-content: top;
  align-items: top ;
  padding-top: 0;
}

h1 {
  font-family: 'IM Fell English', serif;
  text-align: center;
  color: rgb(96, 137,119);
  /* color:rgb(174, 161, 117); */
  font-size: 6rem;
  background-color:rgb(174, 161, 117);
  border-top-right-radius: 75px;
  border-bottom-right-radius: 75px;
  box-shadow: 10px 10px 2px 1px rgba(0, 0, 255, .2);
  margin-bottom: 2rem;
  margin-top: 2rem;
  padding-right: 4rem;
  padding-left: 2rem;
}
.nav {
  display: flex;
  flex-direction: row;
  gap: 10px; 
  margin-bottom: 2rem;
  height: 4rem;
}

.nav-link {
  text-decoration: none;
  color: rgb(96, 137,119);
  padding: 10px 20px; /* Increase padding for a bigger button */
  transition: all 0.3s; /* Simplified transition property */
  font-weight: bold;
  font-size: 2rem; /* Increase font size for larger text */
}

.nav-link:hover {
  color: rgb(96, 137,119);
  transform: translateY(-3px); /* Move the button slightly up */
  /* box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5); Enhance box shadow on hover */
}

.nav-link:active {
  transform: translateY(1px); /* Slightly push the button down on click */
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3); /* Add shadow on active */
}
.spacer {
  border-style: solid;
  border-width: 1px;
  border-right-color:rgb(174, 161, 117);
}

</style>
  