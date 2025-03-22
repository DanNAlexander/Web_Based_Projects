import React, { useState, useEffect, useRef } from "react";

const SnakeGame = () => {
  const boardSize = 20;
  const initialSnake = [{ x: 10, y: 10 }];
  const [snake, setSnake] = useState(initialSnake);
  const [food, setFood] = useState({ x: 5, y: 5 });
  const [direction, setDirection] = useState("RIGHT");
  const [gameOver, setGameOver] = useState(false);
  const gameInterval = useRef(null);

  useEffect(() => {
    gameInterval.current = setInterval(moveSnake, 200);
    return () => clearInterval(gameInterval.current);
  }, [snake]);

  useEffect(() => {
    const handleKeyPress = (e) => {
      if (e.key === "ArrowUp" && direction !== "DOWN") setDirection("UP");
      if (e.key === "ArrowDown" && direction !== "UP") setDirection("DOWN");
      if (e.key === "ArrowLeft" && direction !== "RIGHT") setDirection("LEFT");
      if (e.key === "ArrowRight" && direction !== "LEFT") setDirection("RIGHT");
    };
    document.addEventListener("keydown", handleKeyPress);
    return () => document.removeEventListener("keydown", handleKeyPress);
  }, [direction]);

  const moveSnake = () => {
    if (gameOver) return;
    let newSnake = [...snake];
    let head = { ...newSnake[0] };
    
    if (direction === "UP") head.y -= 1;
    if (direction === "DOWN") head.y += 1;
    if (direction === "LEFT") head.x -= 1;
    if (direction === "RIGHT") head.x += 1;
    
    if (head.x < 0 || head.x >= boardSize || head.y < 0 || head.y >= boardSize ||
        newSnake.some(segment => segment.x === head.x && segment.y === head.y)) {
      setGameOver(true);
      clearInterval(gameInterval.current);
      return;
    }
    
    newSnake.unshift(head);
    if (head.x === food.x && head.y === food.y) {
      setFood({
        x: Math.floor(Math.random() * boardSize),
        y: Math.floor(Math.random() * boardSize)
      });
    } else {
      newSnake.pop();
    }
    setSnake(newSnake);
  };

  return (
    <div style={{ textAlign: "center" }}>
      <h2>Snake Game</h2>
      {gameOver && <h3>Game Over! Refresh to restart.</h3>}
      <div
        style={{
          display: "grid",
          gridTemplateColumns: `repeat(${boardSize}, 20px)`,
          gridGap: "1px",
          border: "2px solid black",
          width: "420px",
          margin: "auto",
        }}
      >
        {[...Array(boardSize * boardSize)].map((_, i) => {
          const x = i % boardSize;
          const y = Math.floor(i / boardSize);
          const isSnake = snake.some(segment => segment.x === x && segment.y === y);
          const isFood = food.x === x && food.y === y;
          return (
            <div
              key={i}
              style={{
                width: "20px",
                height: "20px",
                backgroundColor: isSnake ? "green" : isFood ? "red" : "white",
                border: "1px solid lightgray",
              }}
            ></div>
          );
        })}
      </div>
    </div>
  );
};

export default SnakeGame;
