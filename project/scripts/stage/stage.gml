/// @param obstacle_type
/// @param solos
/// @param dubs
/// @param trips
/// @param gap0
/// @param gap1

var _obstacle_type = argument[0]
var solos = argument[1]
var dubs = argument[2]
var trips = argument[3]
var gap0 = argument[4]
var gap1 = argument[5]

queue[_obstacle_type,obstacle_amount.solo] = solos
queue[_obstacle_type,obstacle_amount.dubs] = dubs
queue[_obstacle_type,obstacle_amount.trips] = trips

obstacle_queue(queue,gap0,gap1)

queue[obstacle_type.link,obstacle_amount.solo] = 1

obstacle_queue(queue,gap0,gap1)