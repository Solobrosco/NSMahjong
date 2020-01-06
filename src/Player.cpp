#include <Player.h>

Player::Player(std::string player){
    // std::cout << "Creating Player of the " << player << std::endl;
    this->player = player;
    if(player == "East"){
        turn = true;
    }
    else{
        turn = false;
    }
}

// Copy Constructor
// Player::Player(const Player& other){
//     this->hand = other.hand;
//     this->turn = other.turn;
//     this->numHand = other.numHand;
// }

//================================================================================================================================

void Player::sortHand(){
    sort(hand.begin(), hand.end());
}

void Player::throwTile(int x){
    hand.erase(hand.begin() + x);
}



int Player::getHand(int x){
    return hand[x];
}

const int Player::getnumHand(){
    return numHand;
}

bool Player::getTurn(){
    return turn;
}

std::vector<int> Player::getReveal(){
    return reveal;
}

std::vector<int> Player::getHand(){
    sortHand();
    return hand;
}



void Player::setReveal(int h){
    reveal.push_back(h);
}

void Player::setHand(int h){
    hand.push_back(h);
}

void Player::setTurn(){
    this->turn = !this->turn;
}

Player::~Player(){
    // std::cout << "Destroyed Player of the " << player << std::endl;
}