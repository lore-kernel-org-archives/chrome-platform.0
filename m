Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170DA220F59
	for <chrome-platform@lists.linux.dev>; Mon, 21 Jul 2025 09:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753090224; cv=none; b=h9QvGLaMihEli0u8zBwNiVP1i1WpFR4+M28KgyuRC4g2QVD6awGFImaTMzGbty76oRrDaIUL/Vx+pU1Ex4Am/sC3eE0tx2NcJdxa/w/10kb7vUWPbDOfWoaVR637hfWpCp7kWaBB8GpiKXkjfSNjU1K6gmrUYi5ACZe3sczftEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753090224; c=relaxed/simple;
	bh=2MNqV+/YeiSYxkae8DG5LKAyZOyfqeEO/7GYpHRNYqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZeR5lrWQFn3VhgTDUyR++XJjQuFL3KD+CuU8/kLzbXLeepFjGfC5hv9PuvFtlJi/gp9pNRcxMEmreirioMizm0MIk4owTnPF/hOnHSESLJ0bWTFZKEfJOTByMUfLenJDRdYFrH/t36aYQqvOjyzT7uu4oLmj484RdbHMvqETffI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJg/E8g3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJg/E8g3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144F7C4CEF1;
	Mon, 21 Jul 2025 09:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753090223;
	bh=2MNqV+/YeiSYxkae8DG5LKAyZOyfqeEO/7GYpHRNYqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EJg/E8g3tEAaDk8Gbt5mApZ46u2BW/auP/HP/79XGAaeBsxTRhBvloVyVGqto7Sho
	 FDNFUtnhSGDso2fqMTHPSzWIgEojBDCAx7OFNKWR5ay/AgUJgpZsyayWmGORKOeA24
	 eQQrshfWN65KORI/rutB2EA/JAUHTVl+xvuQ7bXVD+Sc+cRHzeURCZWT5eYtFJcv4x
	 Za70b3Bvzh1VFOrYYC0XEM9Qic8/60gsLHu5iYylsOhUJwkliBS/n+i3C6Oxcrp1WE
	 pnt0tOmP+pL5Q189ZCwYdF62rOt+F2MJQR8wBo3wT1qyUcDOhlwufqBfkcecBo92H+
	 WleDA+OKjZuQA==
Date: Mon, 21 Jul 2025 09:30:21 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: bleung@chromium.org, dawidn@google.com, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v3 2/8] platform/chrome: cros_ec: Unregister notifier in
 cros_ec_unregister()
Message-ID: <aH4IrVMeVItdyntx@google.com>
References: <20250721044456.2736300-1-tzungbi@kernel.org>
 <20250721044456.2736300-3-tzungbi@kernel.org>
 <2025072119-acronym-sensation-12df@gregkh>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025072119-acronym-sensation-12df@gregkh>

On Mon, Jul 21, 2025 at 08:13:02AM +0200, Greg KH wrote:
> On Mon, Jul 21, 2025 at 04:44:50AM +0000, Tzung-Bi Shih wrote:
> > The blocking notifier is registered in cros_ec_register(); however, it
> > isn't unregistered in cros_ec_unregister().
> > 
> > Fix it.
> 
> Shouldn't this be an independent patch, with the proper Fixes: and cc:
> stable on it, so it can be applied now and backported correctly?  Why is
> a bugfix in the middle of a new feature series?

Sure, I'll separate the patch from the series.
