import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dispatcher/api/articles/dto/article_dto.dart';
import 'package:dispatcher/repository/articles_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../model/article.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final ArticlesRepository articleRepository;

  HomeBloc({required this.articleRepository}) : super(HomeInitial()) {
    log("HomeBloc init..");
    on<FetchArticles>(_onFetchArticles);
  }

  _onFetchArticles(FetchArticles event, Emitter<HomeState> emit) async {
    emit(Loading());
    final articles = await articleRepository.getTopHeadlines();
    emit(ArticlesLoaded(articles: articles));
  }

  // static const articles = [
  //   Article(imageUrl: "images/article_card.png", title: "first", author: "asi", description: "body\nbody\nbody\nbody\nbody\nbody\n"),
  //   Article(imageUrl: "images/article_card.png", title: "second", author: "asidsaf", description: "bodfdsafy\nbodfdsafy\nbodfdsafy\nbodfdsafy\nbodfdsafy\nbodfdsafy\nbodfdsafy\n"),
  //   Article(imageUrl: "images/article_card.png", title: "third", author: "3333", description: "e3e3e3e3\ne3e3e3e3\ne3e3e3e3\ne3e3e3e3\ne3e3e3e3\ne3e3e3e3\ne3e3e3e3\ne3e3e3e3\n"),
  // ];

}


