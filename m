Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D461B81F
	for <chrome-platform@lists.linux.dev>; Mon, 14 Feb 2022 16:30:36 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id r14so15897051qtt.5
        for <chrome-platform@lists.linux.dev>; Mon, 14 Feb 2022 08:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JskXaZJX9EqtyU9nDYwhDYopK1GYBeF5QAk0Zlst3K8=;
        b=WFoQIvGxJEbg8UOaiV70tS6PGdyf3qjcG0fNJQKbyHSfj48VnWpT1uPRsHkSjKp4oI
         VyXEAHc0fq+QePjMo/XUxaUdqQMw6JpndQdJRAM+wSSoz81Cj3PoON8L3Dmir1bNHNxO
         JLMBAFjfwqf69spTV2mC/gqt6Gw5T35QWKhp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JskXaZJX9EqtyU9nDYwhDYopK1GYBeF5QAk0Zlst3K8=;
        b=QttUrR2hHWyt/qGsLnDm1oFiD7mUSdLRi9dhqM6rlYuBOyJsT+lhHJtvWuYKqjQKUh
         7OSWTIHW3v+KJCwN61r7ZJZzz4oWQnXtWRM+WAgfpp+Oj86w0sgxuFHiovunPbxngrAO
         eqYyXEhUTavpP14Q0ci8ClvRqISQNDTkBZUHy4eTGx69nlCbfD0yIIW1XltK8x+t1xxY
         k0PMsDQKYTFGcJ0ifTCu/RoBwD+NwtTlQD4hD/KM10zzFnHNzxKnNRIjOtt0XTkwEWCT
         n+ecg+/pUlPflkPuW8Svct5y5WtdEAX/jZKR8gwRyLEMEfC3mnn9thhsF0LfGkp06qVN
         XBgA==
X-Gm-Message-State: AOAM531Ib88fH4KnTB45Q2m/3fLrPctE1GmNmaqIuq0k4Zho0zgsvXJw
	Igbz1n8YbVfCQaWj2Ts3ksjSnU0+W3v9fw==
X-Google-Smtp-Source: ABdhPJzMTugj3TRaHtFxA6YRIQdU709Ae9yo7/1xhXdjAPwD8/bwxk065xQzJfB4gy3kxZxb+WmnIg==
X-Received: by 2002:a05:622a:cd:: with SMTP id p13mr451021qtw.269.1644856235669;
        Mon, 14 Feb 2022 08:30:35 -0800 (PST)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id o19sm18059060qta.19.2022.02.14.08.30.35
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 08:30:35 -0800 (PST)
Received: by mail-qt1-f175.google.com with SMTP id b5so15883252qtq.11
        for <chrome-platform@lists.linux.dev>; Mon, 14 Feb 2022 08:30:35 -0800 (PST)
X-Received: by 2002:a02:3b67:: with SMTP id i39mr299652jaf.50.1644855749283;
 Mon, 14 Feb 2022 08:22:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com> <20220214081916.162014-5-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220214081916.162014-5-krzysztof.kozlowski@canonical.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Feb 2022 08:22:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wzr=ra=_mt63Uj2p6PSNoEF1F=zN0-0yg5rcWkBFYkZw@mail.gmail.com>
Message-ID: <CAD=FV=Wzr=ra=_mt63Uj2p6PSNoEF1F=zN0-0yg5rcWkBFYkZw@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: rk3399: align Google CROS EC PWM node
 name with dtschema
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, chrome-platform@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, linux-pwm <linux-pwm@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Feb 14, 2022 at 12:20 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> dtschema expects PWM node name to be a generic "pwm".  This also matches
> Devicetree specification requirements about generic node names.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
