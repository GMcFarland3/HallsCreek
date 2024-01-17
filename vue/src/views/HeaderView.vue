<template>
  <header class="header">
    <div class="content">
      <div class="brand">
        <h1>BrewScout</h1>
      </div>
      <div class="nav">
        <router-link v-bind:to="{ name: 'home' }" class="nav-link">HOME</router-link>
        <router-link v-bind:to="{ name: 'login' }" v-if="!$store.state.token" class="nav-link">LOGIN</router-link>
        <router-link v-bind:to="{ name: 'register' }" v-if="!$store.state.token" class="nav-link">REGISTER</router-link>
        <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token" class="nav-link">LOGOUT</router-link>
        <router-link v-bind:to="{ name: 'admin' }" v-if="showAdmin" class="nav-link">ADMIN</router-link>
      </div>
    </div>
  </header>
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
  justify-content: space-between;
  align-items: center;
  background-image: url('../assets/img/banner.webp');
  /* Replace 'your-image.jpg' with the actual image file name */
  background-size: cover;
  /* Adjust to your needs, 'cover' makes the image cover the entire element */
  background-repeat: no-repeat;
  /* Prevent repeating the image */
  background-position: center center;
  /* Center the background image */
  padding: 1px;
  height: 20rem;
}

.content {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  flex-grow: 1;
  text-align: center;
  margin-bottom: 50px;
  /* margin-left: 50px; */
}

#banner {
  width: 100%;
  height: auto;

}

.brand {
  font-family: 'IM Fell English', serif;
  text-align: center;
  margin-bottom: 10px;
  margin-left: 100px;
  color:darkorange;
  text-shadow: rgb(3, 4, 68) 8px 5px 5px;
  display: inline-block; /* To allow padding and border */
  padding: 10px 20px; /* Add padding */
  font-size: 6rem; /* Increase font size */
}

h1 {
  padding: 10px 10px; /* Add padding */
  margin-bottom: 5px;
  font-size: 8rem;
}
.nav {
  display: flex;
  gap: 10px; 
  margin-bottom: 2rem;
}
.nav-link {
  text-decoration: none;
  color: white;
  padding: 10px 20px; /* Increase padding for a bigger button */
  border-radius: 25px;
  transition: all 0.3s; /* Simplified transition property */
  background-color: darkorange;
  font-weight: bold;
  font-size: 2rem; /* Increase font size for larger text */
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3); /* Add box shadow for depth */
}

.nav-link:hover {
  background-color: #333;
  transform: translateY(-3px); /* Move the button slightly up */
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5); /* Enhance box shadow on hover */
}

.nav-link:active {
  transform: translateY(1px); /* Slightly push the button down on click */
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3); /* Add shadow on active */
}

</style>
  