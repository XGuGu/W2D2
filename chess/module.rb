module SlidingPiece

  MOVES = [
     [0, -1],#left:
     [0, 1], #right:
     [1, 0],#up:
     [-1, 0], #down:
     [-1,1], #top_left_diag:
     [1,1],#top_right_diag:
     [-1,-1], #bot_left_diag:
     [1,-1] #bot_right_diag:
  ]



end

module SteppingPiece
  MOVES = [
   [-2, -1],
   [-2,  1],
   [-1, -2],
   [-1,  2],
   [ 1, -2],
   [ 1,  2],
   [ 2, -1],
   [ 2,  1],
   [0, -1],#left:
   [0, 1], #right:
   [1, 0],#up:
   [-1, 0], #down:
   [-1,1], #top_left_diag:
   [1,1],#top_right_diag:
   [-1,-1], #bot_left_diag:
   [1,-1] #bot_right_diag:
 ]

end
