FROM nvidia/cuda:11.3.0-cudnn8-devel-ubuntu20.04
#↓aptをアップデートしてから必要なパッケージをインストールするRUNを追記
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y upgrade && apt-get -y install vim x11-apps xserver-xorg &&\
    apt-get -y install python3 python3-pip python3-tk
RUN python3 -m pip install --upgrade pip && pip3 install numpy pandas scikit-learn matplotlib seaborn jupyter tqdm opencv-python ipykernel
    # pip3 install torch==1.8.1+cu111 torchvision==0.9.1+cu111 torchaudio==0.8.1 -f https://download.pytorch.org/whl/torch_stable.html
RUN pip3 install torch==1.9.0+cu111 torchvision==0.10.0+cu111 torchaudio==0.9.0 -f https://download.pytorch.org/whl/torch_stable.html
EXPOSE 8000


