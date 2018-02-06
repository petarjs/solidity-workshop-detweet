pragma solidity ^0.4.18;

contract Detweet {
  struct Tweet {
    string text;
    uint likes;
    address creator;
  }

  Tweet[] tweets;

  event TweetAdded(address from, string text);
  event TweetLiked(string text, uint likes);

  function Detweet () public {

  }

  function addTweet (string text) public {
    tweets.push(
      Tweet(text, 0, msg.sender)
    );

    TweetAdded(msg.sender, text);
  }

  function likeTweet (string text) public {
    for (uint index = 0; index < tweets.length; index++) {
      if (keccak256(tweets[index].text) == keccak256(text)) {
        tweets[index].likes = tweets[index].likes + 1;
        TweetLiked(text, tweets[index].likes);
      }
    }
  }

  function getLikes (string text) public view returns (uint) {
    for (uint index = 0; index < tweets.length; index++) {
      if (keccak256(tweets[index].text) == keccak256(text)) {
        return tweets[index].likes;
      }
    }
  }
}