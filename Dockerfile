FROM ruby:2-alpine as jekyll

RUN apk add --no-cache build-base gcc bash cmake git gcompat

# install both bundler 1.x and 2.x incase you're running
# old gem files
# https://bundler.io/guides/bundler_2_upgrade.html#faq
RUN gem install bundler -v "~>1.0" && gem install bundler jekyll

# 不用暴露端口了
# EXPOSE 4000 

WORKDIR /site

# 启动命令修改为 jekyll build，生成静态目录即可。
# ENTRYPOINT sh -c "bundle install && bundle exec jekyll serve --trace -P 4000 -H 0.0.0.0" 
ENTRYPOINT sh -c "bundle install && bundle exec jekyll build --watch"