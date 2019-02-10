
document.addEventListener("DOMContentLoaded", function(){
    const canvas = document.getElementById('mycanvas');
    const ctx = canvas.getContext('2d');
    canvas.height = 500;
    canvas.width = 500;
    ctx.fillStyle = 'red';
    ctx.fillRect(0, 0, 100, 100);

    ctx.beginPath();
    ctx.arc(150, 150, 30, 0, 2*Math.PI, false);
    ctx.strokeStyle = 'black';
    ctx.lineWidth = 5;
    ctx.stroke();
    ctx.fillStyle = 'cyan';
    ctx.fill();

    // Filled triangle
    ctx.beginPath();
    ctx.moveTo(100, 100);
    ctx.lineTo(150, 100);
    ctx.lineTo(100, 150);
    ctx.fillStyle = 'violet';
    ctx.fill();
    ctx.closePath();
    ctx.lineWidth = 3;
    ctx.stroke();

});
