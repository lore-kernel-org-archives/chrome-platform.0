Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC0EC64
	for <chrome-platform@lists.linux.dev>; Tue, 22 Mar 2022 12:19:36 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id v2-20020a7bcb42000000b0037b9d960079so2107942wmj.0
        for <chrome-platform@lists.linux.dev>; Tue, 22 Mar 2022 05:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ykocWOAz0Uq+UDyAgiBZ8KQwD5sPDMIaIusCx46+2Ks=;
        b=kKY+qozz/qcYG+/WjZpLBwTWsZ5tYB8zXlI70JV8xHO0EZdrLRb7kZRqQpLv1AKLeE
         V+ah86LXYoSNB33ep5SGvLR9hA81Yxkx4CMt8bv6tX4ZZaLpnDpmKrWXjhG9uQiAalg6
         S80CRpCoCzGXB/IyUuz30WFr39JPiBlgTtiJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ykocWOAz0Uq+UDyAgiBZ8KQwD5sPDMIaIusCx46+2Ks=;
        b=IhiNeUPT74IgeLoQVoVjP/5haX0MWabpHPu5GQ1e1DhwPSN1rqaNmNo1kCTgGFDHrw
         2D0CC5AeXfyBIXno/69PG7l/6rFZhn+JIJ4cLBQPWo7Anp3Y1F7HIsQmDiUal7vTIi1A
         Iw4WEa7ufoqOdt4aONTvU+DdvUuFsEV5XkrDsFXKedxKkitjlUDYA0PqW2UWe5Li25Im
         YPJBm2Oe+OJr5wcDXdWAuJq5kDm/cebwFrerpSWzGAeadtEloo/joAmTsm/9Pqn4fHKA
         wd0C1XirK1lesZS5yoE5Dbwa1kQCo9ocx3r2KU9vdJocier6OBnLVeagygYjV9F3uERl
         MdZw==
X-Gm-Message-State: AOAM531EpQY77blg4NEPjq51pzbBd+AFsk920r3lsyXSUZd4HfpnX0et
	T1D2jROeFZ1itKukyUY6iIaIhw==
X-Google-Smtp-Source: ABdhPJyFLwDH5nAIAcJ9p0nfgQAFOIKhSm1IVpSDXY9TL57Dd6kWriAXvFvzHaFUdFaXQn45mmhONA==
X-Received: by 2002:a1c:e908:0:b0:38c:782c:2a62 with SMTP id q8-20020a1ce908000000b0038c782c2a62mr3433024wmc.135.1647951574957;
        Tue, 22 Mar 2022 05:19:34 -0700 (PDT)
Received: from google.com ([37.228.205.1])
        by smtp.gmail.com with ESMTPSA id l13-20020adfbd8d000000b002040daf5dffsm9233464wrh.18.2022.03.22.05.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 05:19:34 -0700 (PDT)
Date: Tue, 22 Mar 2022 12:19:32 +0000
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	chrome-platform@lists.linux.dev, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: update google,cros-ec-pwm documentation
Message-ID: <Yjm+1ON8o5y/qcKG@google.com>
References: <20220321143222.2523373-1-fabiobaltieri@chromium.org>
 <20220321143222.2523373-4-fabiobaltieri@chromium.org>
 <09b4b714-4fb5-f2af-5a88-b48cbff35b7d@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09b4b714-4fb5-f2af-5a88-b48cbff35b7d@kernel.org>

On Mon, Mar 21, 2022 at 04:47:54PM +0100, Krzysztof Kozlowski wrote:
> On 21/03/2022 15:32, Fabio Baltieri wrote:
> > Update google,cros-ec-pwm node documentation to mention the
> > google,use_pwm_type property.
> > 
> > Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> > ---
> >  .../devicetree/bindings/pwm/google,cros-ec-pwm.yaml         | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
> > index 4cfbffd8414a..2224e8e07029 100644
> > --- a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
> > +++ b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
> > @@ -19,6 +19,12 @@ description: |
> >  properties:
> >    compatible:
> >      const: google,cros-ec-pwm
> > +
> > +  google,use_pwm_type:
> 
> Hyphens, not underscores.

Oh thanks, will change for v2.

> 
> 
> Best regards,
> Krzysztof

-- 
Fabio Baltieri
