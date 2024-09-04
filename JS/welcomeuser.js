import * as THREE from 'https://cdn.skypack.dev/three@0.129.0/build/three.module.js';

import { OrbitControls } from 'https://cdn.skypack.dev/three@0.129.0/examples/jsm/controls/OrbitControls.js';

import { GLTFLoader } from 'https://cdn.skypack.dev/three@0.129.0/examples/jsm/loaders/GLTFLoader.js';

import TWEEN from 'https://cdn.jsdelivr.net/npm/@tweenjs/tween.js@18.5.0/dist/tween.esm.js'

    let canvasForm = document.getElementById("dCanvas");
    let width = canvasForm.offsetWidth,
    height = canvasForm.offsetHeight;

    
    let scene = new THREE.Scene();

    let camera = new THREE.PerspectiveCamera(75, width / height, 0.1, 1000)
    

    let objects;
    let controls;

    let loader = new GLTFLoader();

    loader.load(
        '../car/scene.gltf',
        (gltf) => {
            objects = gltf.scene;
            scene.add(objects);
        },
        (xhr) =>{
            console.log((xhr.loaded / xhr.total * 100) + '% loaded')
        },
        (error) => {
            console.error(error)
        }    
    );
    let renderer = new THREE.WebGLRenderer({
        alpha: true
    });
    renderer.setSize(width, height)

    document.getElementById("dCanvas").appendChild(renderer.domElement);

    camera.position.set(5, 0, 1);
    camera.lookAt(scene.position);
    renderer.render(scene, camera);
    console.log("Direct camera position set:", camera.position);


    controls = new OrbitControls(camera, renderer.domElement)

    function animate() {
    requestAnimationFrame(animate);
    TWEEN.update();
    renderer.render(scene, camera);
    }
    animate();


    let ambientLight = new THREE.AmbientLight(0x404040, 1);
    scene.add(ambientLight);

    let directionLight = new THREE.DirectionalLight(0xffffff, 1);
    scene.add(directionLight);
    directionLight.position.set(0, 1, 0);  

    let light = new THREE.PointLight(0x4c4c4c, 10);
    light.position.set(0, 300, 500);
    scene.add(light);

    let light2 = new THREE.PointLight(0x4c4c4c, 10);
    light2.position.set(500, 100, 0);
    scene.add(light2);

    let light3 = new THREE.PointLight(0x4c4c4c, 10);
    light3.position.set(0, 100, -500);
    scene.add(light3);

    let light4 = new THREE.PointLight(0x4c4c4c, 10);
    light4.position.set(-500, 300, 500);
    scene.add(light4);

function showmore(){
        let slider = document.querySelector("#slider")
        let show = document.getElementById("showMore");
        
        let status = 'contentOne'
    
        show.addEventListener("click",()=>{
            slider.classList.remove("contentOneAction");
            slider.classList.remove("contentTwoAction");
            switch (status){
                case 'contentOne':
                    runCamera(3, 0, 1)
                    slider.classList.add("contentTwoAction");
                    status = 'contentTwo'
                break;
                case 'contentTwo':
                    runCamera(2, 3, 1)
                    status = 'fullscreen'
                break;
                case 'fullscreen':
                    runCamera(5, 0, 1)
                    status = 'contentOne'
                    slider.classList.add("contentOneAction");
                break;
    
                default:
                    break;
            }
        })
}
        
function runCamera(x, y, z) {
        console.log("Running camera tween", x, y, z);
        
        let targetPosition = new THREE.Vector3(x, y, z);
        let duration = 1200;
        
        let tween = new TWEEN.Tween(camera.position)
            .to(targetPosition, duration)
            .easing(TWEEN.Easing.Quadratic.InOut)
            .onUpdate(() => {
                
                camera.lookAt(scene.position);
                renderer.render(scene, camera);
            })
            .start();
}
showmore()

window.addEventListener('resize',()=>{
    width = canvasForm.offsetWidth;
    height = canvasForm.offsetHeight;
    camera.aspect = width / height;
    camera.updateProjectionMatrix();
    renderer.setSize(width, height);
})

function navBar(){
    let menu = document.querySelector(".menu")
let close = document.querySelector(".close")
let navContent = document.querySelectorAll(".nav-content a")
menu.addEventListener("click", ()=>{
    navContent.forEach(item =>{
        item.style.display = "flex";
    })
    menu.style.display = "none";
    close.style.display = "block"
})
close.addEventListener("click", ()=>{
    navContent.forEach(item =>{
        item.style.display = "none";
    })
    menu.style.display = "block";
    close.style.display = "none"
})
}

function profile(){
    let showMore = document.querySelector(".nav-content .more");
    let links = document.querySelector(".multiple-links");

    showMore.addEventListener("mouseover", () => {
        links.style.display = "flex";
    });

    links.addEventListener("mouseleave", () => {
        links.style.display = "none";
    });
}


profile()
navBar()