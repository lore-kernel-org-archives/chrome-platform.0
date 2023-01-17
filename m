Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D0D1FB2
	for <chrome-platform@lists.linux.dev>; Tue, 17 Jan 2023 08:19:10 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id k16so955319wms.2
        for <chrome-platform@lists.linux.dev>; Tue, 17 Jan 2023 00:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rP63dQoKrc5ALXi+XQewv4pw0EMdxTLtQnZfEuBYC1w=;
        b=XVvab/HH63+Cb1WPgxOaRc2tKkm28tFac1llzqPmnqsJk8f9t/fiJm8po6KQtVwop2
         5lpimU0W7tVZK9bkf514PqE4j+MbAfa1Tpg0NkLrgy+ABqHQk3q9AjIUEyjfxi8f2hvX
         495UIvkDXZUCc/2/T27DZm4fO9x9jMALjHid8Fjka2CEGsXhLn168v3N49n8pNAVpF5j
         srU3m6c4IC8sNBvkzxnc6MI7d4orTrjpwIsWbDKxdBtHUDsrFcnJ/wyhi3RUWdvooS9Q
         vQaUfY0lMZU8969qlSYiI1cznC9/hOvDY0wh3ctwifIV5esEYlAEteN1hNTjH1+/v7WW
         jL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rP63dQoKrc5ALXi+XQewv4pw0EMdxTLtQnZfEuBYC1w=;
        b=IohexB+Ujw0GPYdu9hXX+cbCZh/EYGP/ZtAPXA6IChSk84kdPXTCObg6Q4V+xlFizT
         /Ra3wloe+hpEeBAEAkm6o0iC5tj4N4clpsYCw0w+mJUG02dhjEmk+If99TLTjDRAWPHm
         /gIsuSf3BTmCeePGT+xtI7hMicIgZGOL8KtAr7hewNzCx5OFSFhzBrsm5Zae7DV7Fm2z
         /IBx1vNhTzUiO7flEzOIsdjB0VS9fRHduGfpj2s9zuWTu4dLP20BJWHyYUeJEdRtzG+E
         hCMjj1Hd1gOQgkIzJuieu3vv0huWuUydc4tSwjZV0kskwuAbc8f+PAaRthHKxuh6FX7U
         fIwQ==
X-Gm-Message-State: AFqh2kr2tnUYeMWSJKTN07Gn8PPHiwitYEy7k53wTAn8+2xZnbcWbCCA
	xx9eO4H8Ol3le8kL0fH8K2s=
X-Google-Smtp-Source: AMrXdXvLcD7SOzYUxnRHzWPNwcQcKslVSAiy1d/SNDrMD2nTutYgl3a9UQAEmGQcoaWDqKh2YZe01Q==
X-Received: by 2002:a05:600c:3ca6:b0:3d1:caf1:3f56 with SMTP id bg38-20020a05600c3ca600b003d1caf13f56mr11019795wmb.9.1673943548342;
        Tue, 17 Jan 2023 00:19:08 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z22-20020a7bc7d6000000b003cfa81e2eb4sm8679963wmk.38.2023.01.17.00.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 00:19:07 -0800 (PST)
Date: Tue, 17 Jan 2023 11:19:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, markhas@chromium.org,
	bhanumaiya@chromium.org
Subject: Re: [PATCH] platform/chrome: cros_ec_uart: fix negative type
 promoted to high
Message-ID: <Y8ZZ+MZvtkYR0aD2@kadam>
References: <20230109081554.3792547-1-tzungbi@kernel.org>
 <Y8ZYeIev6SR2vMs6@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8ZYeIev6SR2vMs6@google.com>

On Tue, Jan 17, 2023 at 04:12:40PM +0800, Tzung-Bi Shih wrote:
> On Mon, Jan 09, 2023 at 04:15:54PM +0800, Tzung-Bi Shih wrote:
> > serdev_device_write_buf() returns negative numbers on errors.  When
> > the return value compares to unsigned integer `len`, it promotes to
> > quite large positive number.
> > 
> > Fix it.
> > 
> > Fixes: 04a8bdd135cc ("platform/chrome: cros_ec_uart: Add transport layer")
> > Reported-by: Dan Carpenter <error27@gmail.com>
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > ---
> > Reported in https://lore.kernel.org/chrome-platform/Y7fhw4S7Tb0GcHMF@kili/T/#u.
> > 
> >  drivers/platform/chrome/cros_ec_uart.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/platform/chrome/cros_ec_uart.c b/drivers/platform/chrome/cros_ec_uart.c
> > index 6916069f1599..788246559bbb 100644
> > --- a/drivers/platform/chrome/cros_ec_uart.c
> > +++ b/drivers/platform/chrome/cros_ec_uart.c
> > @@ -149,9 +149,10 @@ static int cros_ec_uart_pkt_xfer(struct cros_ec_device *ec_dev,
> >  	resp->status = 0;
> >  
> >  	ret = serdev_device_write_buf(serdev, ec_dev->dout, len);
> > -	if (ret < len) {
> > +	if (ret < 0 || ret < len) {
> >  		dev_err(ec_dev->dev, "Unable to write data\n");
> > -		ret = -EIO;
> > +		if (ret >= 0)
> > +			ret = -EIO;
> >  		goto exit;
> >  	}
> 
> Does this patch make sense to someone in the mailing list?

Yeah.  It looks fine.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

