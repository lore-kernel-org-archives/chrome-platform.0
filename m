Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1769F30677E;
	Wed, 29 Jul 2026 03:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785296378; cv=none; b=UlGPLSjh27xXLkw2FTE8hwB+KIAJJ128yeVTwv43qvSxcNAkrrusplOYN7Ft4Fee9y/ejSKIvANUhI8ctNAEVocp0Wqi1hTtRr1o/sF8Klg0jXS1CsbR8amepfvWmKi7w60zaY3B9ra1hHXDH9UWGAqgNN5OX3kPcga79KoSyEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785296378; c=relaxed/simple;
	bh=85wRaR+83o+2tu17M8FE4rYP718yf2tE1EpWYpkiFPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGF9N+t99TkB0HfkLRhZno5IEDwgK2kiFItlSGOeKFfl/7XPGmrCNIkpGrYqlqRSdz2Pg6O/+3QU2CK+vJWDtYFW42nemMQ38nZyDmi6pSrsuyVsLDRmbf8PaVtIxWjMd4hlB8ix34emK0t1UXwkTbZDotidkNJbmUs0y/AYaJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Et62eLu5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Et62eLu5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 970151F000E9;
	Wed, 29 Jul 2026 03:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785296376;
	bh=F1kdaEnN4w7YP5OXv3qlA7FjRC2Urw/Ah/aVXxhnwtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Et62eLu5vGbHv3aV8I9xOnx+b5Y0kq5u+N474Q2n/2RAFdR0cMHgp0Y6XsGS/dj/U
	 HHUarpuzriNkBItrFFOps0b+yk159eqOEsVelro3SPexkbWDam6Jy6TAsW5qKVvp9F
	 vARP+C+YsMOgI7YYiNGZ9H1LDeIfWNKn27Y7vNhkkNLO8Z6qFZzgDCdd6iE3tyhbMV
	 LQeUHYzm3J9P4ffk9XTw6eQ4eU+mG6BhPVifdQXZwO9fHQMORu5QJIo64P5Z/dnsBV
	 P1bNQ2SBI3m+nXLWUmbXCtJxJL6FNqFgyC1npIuA51Qml2dGrFsSAAZYZhGeqE6xF/
	 kZbKmLr8v+h+g==
Date: Wed, 29 Jul 2026 03:39:33 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Hongyan Xu <getshell@seu.edu.cn>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn
Subject: Re: [PATCH] platform/chrome: cros_ec_debugfs: unregister panic
 notifier
Message-ID: <aml19Q7Zj-Q8f_Se@google.com>
References: <20260728123423.781-3-getshell@seu.edu.cn>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728123423.781-3-getshell@seu.edu.cn>

On Tue, Jul 28, 2026 at 08:33:37PM +0800, Hongyan Xu wrote:
> Unregister the notifier before tearing down debugfs state. Also run the
> console-log cleanup in the probe error path.

Thanks for looking into this.  This should separate into 2 patches: 1 for
cros_ec_cleanup_console_log() and 1 for blocking_notifier_chain_unregister().

> @@ -534,6 +534,7 @@ static int cros_ec_debugfs_probe(struct platform_device *pd)
>  	return 0;
>  
>  remove_debugfs:
> +	cros_ec_cleanup_console_log(debug_info);

It can be called even if cros_ec_create_console_log() isn't called.  It's
harmless because cros_ec_cleanup_console_log() checks
`debug_info->log_buffer.buf`.

To be clear, I'd prefer to introduce a new goto label for fixing it.
