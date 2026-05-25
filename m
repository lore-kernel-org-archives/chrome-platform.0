Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57894346E63;
	Mon, 25 May 2026 05:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779687818; cv=none; b=d8ttGqMTMJm+o7iB0eBAQ86TrVMvy+H8wP7bC5WDiwR2DDzTkIxRt7P9ZqRDu3YxJbnayBBAsxTHlp68yM2UIgN2SAJK8yfucJIzGu1ULj58tGOt4XEBGUDWou2hubpn2rHauNwQdpTQbqZRk0H7vGAe47QWJeoqwzx3TqfvfMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779687818; c=relaxed/simple;
	bh=CAXJbWBR8qHhz3Zw9TNVqu7v3qswxGuLwIh6w7s47no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMGNUbzQaXNw2BAJ15BcN+UY+9piKL6bVV3BaXvbntq4E2bFeZDWEE3J1S0HrujnbRs7giyKHf6kNv8KiUKogR2lv873mHqMBg1QWxriYznrU+UDz7fPOx7sm6ihuNb+O7R2mDZgoL8YFigD+kRWdqFC8CP4hdj1gs9UEgyKLvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMLVGwKP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMLVGwKP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843B51F000E9;
	Mon, 25 May 2026 05:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779687815;
	bh=vp3U23eBBLbTvkiGnqLyPAmNfSFLzR0XLJT5I7sm2nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IMLVGwKPfM1EQZ3FZ+QMDVLR0fM3q2zDx8kl6iVzPZnxPZ6SsT9MhTgfpxcfJlz+9
	 Ec0iVB3XpobekM1Zxr+IBY1XE8afMQ2Of/oY7sztcza+DIH3ta3xW1iGZTsvZHYyEO
	 d1FpkB2iWyJEAmDSUML+2LOiGuVe18iL+1xKd0gT/R81XtcPCtj7PqfjC+QNLYH3dV
	 5FML6cAKwzViBAyNBaLGdSZk8AvmTiq50GAdThCp2KooPpFc4N2eWG5vFPKYjf2sEL
	 tJ/1+BJmx06XKVJz0+p7ZBl8HowBkTvhtBkNulIR6eyb4wWnJr3jVjzkFuYMUXkN2d
	 BUlm0pWFH3QSA==
Date: Mon, 25 May 2026 05:43:32 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Benson Leung <bleung@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] platform/chrome: cros_ec_chardev: Introduce rwsem
 for protecting ec_dev
Message-ID: <ahPhhLyLsopo8XXU@google.com>
References: <20260516143017.18560-1-tzungbi@kernel.org>
 <20260516143017.18560-5-tzungbi@kernel.org>
 <20260521135830.GH3602937@nvidia.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521135830.GH3602937@nvidia.com>

On Thu, May 21, 2026 at 10:58:30AM -0300, Jason Gunthorpe wrote:
> On Sat, May 16, 2026 at 10:30:17PM +0800, Tzung-Bi Shih wrote:
> > @@ -330,10 +350,18 @@ static long cros_ec_chardev_ioctl_xcmd(struct chardev_priv *priv, void __user *a
> >  	}
> >  
> >  	s_cmd->command += priv->pdata->cmd_offset;
> > -	ret = cros_ec_cmd_xfer(priv->pdata->ec_dev, s_cmd);
> > -	/* Only copy data to userland if data was received. */
> > -	if (ret < 0)
> > -		goto exit;
> > +
> > +	scoped_guard(rwsem_read, &priv->pdata->ec_dev_sem) {
> > +		if (!priv->pdata->ec_dev) {
> > +			ret = -ENODEV;
> > +			goto exit;
> > +		}
> 
> Same remark, don't use scoped_guard. Each fops should simply start
> with:
> 
> 	guard(rwsem_read)(&priv->pdata->ec_dev_sem);
> 	if (!priv->pdata->ec_dev)
> 		return -ENXIO;
> 
> There is no point in trying to carefully partially do some part of the
> ioctl of the driver has been removed.

Fixed those in the next version [1].

Just a note, the code still uses -ENODEV instead of -ENXIO if you have no
objection.

> > @@ -451,6 +485,8 @@ static void cros_ec_chardev_remove(struct platform_device *pdev)
> >  
> >  	blocking_notifier_chain_unregister(&pdata->ec_dev->event_notifier,
> >  					   &pdata->relay);
> > +	scoped_guard(rwsem_write, &pdata->ec_dev_sem)
> > +		pdata->ec_dev = NULL;
> 
> This seems out of order.
> 
>   	misc_deregister(&pdata->misc);
> 
> ^^ Is first because it stops new fops from being created
> 
>  +	scoped_guard(rwsem_write, &pdata->ec_dev_sem)
>  +		pdata->ec_dev = NULL;
> 
> ^^ Stops existing fops from running
> 
> Then you can go on to destroy the notifier chain and so on as there is
> now no concurrent touches to pdata.

Fixed in the next version [1].

[1] https://lore.kernel.org/all/20260525052654.4076429-5-tzungbi@kernel.org
