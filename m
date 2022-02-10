Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001FE2F28
	for <chrome-platform@lists.linux.dev>; Thu, 10 Feb 2022 03:11:42 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id p6so469877plf.10
        for <chrome-platform@lists.linux.dev>; Wed, 09 Feb 2022 19:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rwtTJPAlzjrk6k7AFsCR2v9W/lrykO+f5Ngu1AoU0UM=;
        b=M81mm4bVgal4WsC1Rinuyy6QZmdxsCffFr2cuNshEJfKzYhauSzZ9yTJnmAzHDPMnD
         rSywrxA0mofpoKqUhc00vyofd0wKC5kyYUvGp1xa8JqKSVotgMDNZyCv/7iHQFQtwL2X
         ANzBrq12ALSWVsvEer4e2THG6xbYRHZFcoMNg/1fEjoKF71PjcjQye7JbDSb7aICKbsA
         sGbV4r80POBTqCVkgZmf/D+9xDan3PsE+ucSqinw+v5Ys/RQNsMPnJNPtWbCtmVc+Etb
         WPE+diYf1KmAQIqtGTSa7dgkGJsW4ACZ2HBb2UDgtRbMN1LOhq7SiszFzsLUu/Psflkb
         PUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rwtTJPAlzjrk6k7AFsCR2v9W/lrykO+f5Ngu1AoU0UM=;
        b=PPcDVSM8beUJ6IOK7s7bd08sUJ2NGDQ1ZEWJdB8BNwbFS5vzvHAXtpjg4KW/fD225W
         wIldxcrzqw0iZk9BHHCZozL9Wc8oq2YEfs1zbn1rYOztktuWstMw1aM55AP9UwLdY4Xl
         bbe8JQBt6MSInttqO/rLnbwm2gvV31p6CeZ7LwhdkFQ+wJuLNrByB6h2jamVRcDGz2zo
         vmJK35Od5doULxHW6HmeAHmho/+NAdQBB1z/IxeExZmtCb/zQ1ZkVQLtg+0V5y8BakVq
         Volhiqw5fTUA10is2qNN5+jbCiNbBNcowjqwAC7KEDGMlSpHALVAjBgUqqiBRUoG9SqJ
         iDoA==
X-Gm-Message-State: AOAM533M8Yjn7ONOU1f4YgUhnNcrEsgsKT2e5vs2TXCjKEtfqkxPaQUK
	+8dcF+yDceGjbDYJxnKf/eJ3Ow==
X-Google-Smtp-Source: ABdhPJwBkZw6F8n3KA+ugeyrPklhH1SgnVM3vv+trNZ50QMp4uRMcZkq0UjV1BkteudYyAOGh4WI/g==
X-Received: by 2002:a17:90b:1806:: with SMTP id lw6mr567968pjb.124.1644462701922;
        Wed, 09 Feb 2022 19:11:41 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:ee29:8b32:75bc:44ec])
        by smtp.gmail.com with ESMTPSA id q11sm23157638pfk.149.2022.02.09.19.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 19:11:41 -0800 (PST)
Date: Thu, 10 Feb 2022 11:11:39 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev
Subject: Re: [RESEND PATCH v2] platform/chrome: cros_ec_debugfs: detach log
 reader wq from devm
Message-ID: <YgSCaxROG+8kpznR@google.com>
References: <20220209051130.386175-1-tzungbi@google.com>
 <CACeCKadXU+pX=3m5d6SMnx4pxpRpgsCWN15HhOUpxocTadKFtQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACeCKadXU+pX=3m5d6SMnx4pxpRpgsCWN15HhOUpxocTadKFtQ@mail.gmail.com>

On Wed, Feb 09, 2022 at 01:30:14PM -0800, Prashant Malani wrote:
> On Tue, Feb 8, 2022 at 9:11 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> > +/* waitqueue for log readers */
> > +static DECLARE_WAIT_QUEUE_HEAD(cros_ec_debugfs_log_wq);
> 
> Hmm, I'm always wary of introducing statics to address races like this.
> 
> Doesn't re-ordering cros_ec_debugfs_remove() avoid the race? :
> diff --git a/drivers/platform/chrome/cros_ec_debugfs.c
> b/drivers/platform/chrome/cros_ec_debugfs.c
> index 272c89837d74..80bd898c3271 100644
> --- a/drivers/platform/chrome/cros_ec_debugfs.c
> +++ b/drivers/platform/chrome/cros_ec_debugfs.c
> @@ -485,8 +485,8 @@ static int cros_ec_debugfs_remove(struct
> platform_device *pd)
>  {
>         struct cros_ec_dev *ec = dev_get_drvdata(pd->dev.parent);
> 
> -       debugfs_remove_recursive(ec->debug_info->dir);
>         cros_ec_cleanup_console_log(ec->debug_info);
> +       debugfs_remove_recursive(ec->debug_info->dir);
> 
>         return 0;
>  }

I have tested the patch and it doesn't help.  The issue is: cros_ec_debugfs
provides a wait queue to fs at [1]; fs remembers the address at [2].  The wait
queue is in devm memory.  After the memory has freed (i.e. the device has
removed), fs still gets chance to access the memory (e.g. [3] in the case).

[1]: https://elixir.bootlin.com/linux/v5.17-rc3/source/drivers/platform/chrome/cros_ec_debugfs.c#L176
[2]: https://elixir.bootlin.com/linux/v5.17-rc3/source/fs/eventpoll.c#L1256
[3]: https://elixir.bootlin.com/linux/v5.17-rc3/source/fs/eventpoll.c#L550
