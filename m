Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1146C163
	for <chrome-platform@lists.linux.dev>; Mon,  9 Jan 2023 18:52:07 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id i188so9651812vsi.8
        for <chrome-platform@lists.linux.dev>; Mon, 09 Jan 2023 10:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6EzAq7c2qLRAvCnEFOtaH1rBYf66S03YCSV4FLul3o=;
        b=lwK1OVaK/2rCoIpf1QXPOIuORMzeyDc073qpOCy9VPPDaOPk8c/qIL8Q+v8w094Zi7
         hXVArwYttLBgL/8BHAZzUz7765DSwLRjm8qldh5ndGWzCMUEuIh680q8Ym19xI4W+p3p
         N5rQkZwm5kBdV1+Vs5wyiJwk73IPVc46eGzYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z6EzAq7c2qLRAvCnEFOtaH1rBYf66S03YCSV4FLul3o=;
        b=TFazeHz312NurMlElxoGWCsyBpHfJKa+/4eX3VEJTF6C/11zdOg8V9qHuqLBgDm8g3
         WWfpRglWqzYcDMSqHDssh3n/ybeDlih3W4/SC919QgkSue57ehZqeWeYsKGvA0BtTXpB
         P5Bs00gwgSRuAV9jguplNqGaJgIY5NQgdORDvpiy0jlQ1YFyRAB6l9bnTpmicJLyhxvl
         VuzSjNjN1BVIIe7L84/na4yxGr3OU4nHewt6pj3ygsPXSE7oljW0Z431BXe21hU8se9P
         XWGjTQS/mI329rqUkyQ3kp9CIV8HL0PT222Uezwqo+CokRp83/xicsEgHmyOBJhOtWhp
         ubeg==
X-Gm-Message-State: AFqh2kr4uZa2h+sCSnKXhJ5RBTkvy92tzLjiO7d4Ps7LzQbPH/Zh//56
	ze4+Td63yXehX+PoeFb0AGi7KGFm47puIB1xpBfalA==
X-Google-Smtp-Source: AMrXdXufjgzX2onx1RlVtYrCWrMQQwXENC9o1EC8gzy8NQPRK5PzoA6pBDBAqM0SDMWRhUkCFSuy+13/Yy3X2gRU6KA=
X-Received: by 2002:a05:6102:1179:b0:3bb:425f:75ea with SMTP id
 k25-20020a056102117900b003bb425f75eamr10320213vsg.80.1673290326845; Mon, 09
 Jan 2023 10:52:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230109081554.3792547-1-tzungbi@kernel.org>
In-Reply-To: <20230109081554.3792547-1-tzungbi@kernel.org>
From: Mark Hasemeyer <markhas@chromium.org>
Date: Mon, 9 Jan 2023 11:51:56 -0700
Message-ID: <CANg-bXANdV=EpDu2Zn0BJh5s6cJPYRxyjmVfbWUQ0CufC9CuSA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_uart: fix negative type promoted
 to high
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev, 
	bhanumaiya@chromium.org, error27@gmail.com
Content-Type: text/plain; charset="UTF-8"

>     175         if (host_response->data_len > ec_msg->insize) {
>     176                 dev_err(ec_dev->dev, "Resp too long (%d bytes, expected %d)\n",
>     177                         host_response->data_len, ec_msg->insize);
>     178                 ret = -ENOSPC;
>
> ret = -EINVAL;  (Unless you are discussing harddrives).
>
>     179                 goto exit;
>     180         }
The report also suggested modifying the return value if a response packet is too
long.
