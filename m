Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652037E
	for <chrome-platform@lists.linux.dev>; Tue, 26 Apr 2022 14:02:19 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id i5so6565446wrc.13
        for <chrome-platform@lists.linux.dev>; Tue, 26 Apr 2022 07:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Q2GTfUc7VLX7J3kb7UZo3L6hgl7G3SCi+Soy09ZT8/Q=;
        b=V16PSVQfUB/Or3B+sTPWN0OESvTLnOXJvVItFoiiWr+i+XWczhhBYVqK0CQKrBFUPV
         2nQrPeuHneJbpozsMrqjc0knwusbWrNPFgRqv28DbmGNIILbFLlzBHm98vIKW6Pp1XT1
         S//6Kt+IKv+px8Q76JYBkx1Hxff3JHR3cKMP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q2GTfUc7VLX7J3kb7UZo3L6hgl7G3SCi+Soy09ZT8/Q=;
        b=epVN4bpvZZB8PkNAykjN1jp8dabvwKZBMbrHZGb3V/a81pZqz9VIRX7De+Az5mhU3C
         YW+lnpJ4Ax+yC17iawEG7dk95vul5Hq33lEaI3zqEYiVzmJ7unLX28nUGVArjJREA1uu
         ET4OMonDs0lkj2vNmmbn5DDZvApuT77gLQrc/xz4XN6wlPN4fyOeLkfAusp9p3znONlO
         UNeZGWh1A+ocVV+n3iA2CPHI/uUwGhuKiLev9EOKKjqKRxeMhyVV5caefdjKpAF/IQkB
         xybgx2ApYusYLHtGEsn7DBeLpYsIGjzpZ+NX08abVXczjJNWTOO3eMBOLgfvaQ3OVcWY
         J4kg==
X-Gm-Message-State: AOAM531TblgvQsFTgA/dKT/OJJ0nXtdrMIsXsLZY5mKRX0tkeJI6iMoc
	03V+u66l781SpYv4b2wo6a7iZQ==
X-Google-Smtp-Source: ABdhPJxic/QZR2BhX6akoIU8RQ/B3yNQzrr038cwGWxQtu13ObaIie5wUl501AIceUw/M1p5EPN2Vg==
X-Received: by 2002:adf:e346:0:b0:205:97d0:50db with SMTP id n6-20020adfe346000000b0020597d050dbmr18586212wrj.257.1650981737632;
        Tue, 26 Apr 2022 07:02:17 -0700 (PDT)
Received: from google.com ([37.228.205.1])
        by smtp.gmail.com with ESMTPSA id j13-20020a05600c190d00b00393ee555683sm5414256wmq.27.2022.04.26.07.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 07:02:17 -0700 (PDT)
Date: Tue, 26 Apr 2022 14:02:15 +0000
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Rob Herring <robh@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>, chrome-platform@lists.linux.dev,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] dt-bindings: update google,cros-ec-pwm
 documentation
Message-ID: <Ymf7Z/BJQSWO6pjE@google.com>
References: <20220420141556.681212-1-fabiobaltieri@chromium.org>
 <20220420141556.681212-4-fabiobaltieri@chromium.org>
 <YmcZn8mWQveT5HzT@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmcZn8mWQveT5HzT@robh.at.kernel.org>

On Mon, Apr 25, 2022 at 04:58:55PM -0500, Rob Herring wrote:
> On Wed, Apr 20, 2022 at 02:15:55PM +0000, Fabio Baltieri wrote:
> > Update google,cros-ec-pwm node documentation to mention the
> > google,cros-ec-pwm-type compatible.
> 
> It would be good if the subject provided some clue what the update is. 
> Every change is an update. And all bindings are 'documentation' so 
> that can be dropped.

Fair enough, I'll reword the subject and send a v6.

> 
> > 
> > Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> > ---
> >  .../devicetree/bindings/pwm/google,cros-ec-pwm.yaml      | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> In any case,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

Thanks!

-- 
Fabio Baltieri
