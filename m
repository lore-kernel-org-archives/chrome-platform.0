Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280143DDB11;
	Mon, 24 Aug 2026 05:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787550452; cv=none; b=ABpJPfF0Wb+NZKt4s5dalayaSHXLqanEfzY4/LGV3r493C29UXFIRiTA8rNb+Ci780DfLEwi9EKURk6A6HGRDJqG2Y7v+O6o7qAqpfzvnWhnTaQPfoawgx5tjPmtWRApVAjnZaisuJD7HsgdGQMgRuF++6rbFlOciOd+6QiFko8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787550452; c=relaxed/simple;
	bh=W4Fk+aUNYbiWj9OI4gEigcO7NWxIMMpHPlTGhSfUCHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbD0TmGl1v1vHhDwuACDFBPgumbU28njvciJYEQwAaAubDScV32PCRIW8Bl34BRsotAKH/+On5OtinQ5p+q1L3gKt/U7IpygGCDgKq5fnZRW+eRu0A8lfiBq8zqsAzJ/bTOHsaWJNhlhgcuUR1uo24j+Yu8xaUdL+DPKMQR/TqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MeFfauAe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MeFfauAe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23B11F000E9;
	Mon, 24 Aug 2026 05:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787550450;
	bh=G1C/T8XLM1Om3ZzNfKXHn2Juv/XDr/jyOcvTOuYQvGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MeFfauAeMpvh6LDWX582vf/2lCBADRRgIlMioE0/ZItV7QEWIQlufuWMbF8+7EOnS
	 5pa2pn0ztYB9+uzpKUmhX16aiiQoXB3EVe8DqnlJRCEXFczqxueLpUcMQ8TX356jSk
	 xI+Qh1SEVVMSri/SOnrdTt7CpJTJyxEz4pxA8aFxY0QqPIW1cVZ2yPdgts10mO8rhd
	 IBsnWffkQy4YSBVnQL07Zmf1fqfscZKDI0RVeulhge+o69FDwQQi+zJNw28NSSf7iF
	 YIR+cJoYxb3tNBw4S0WU17mNjcj9fy80dQZKui+m1ASecupdb7UkUN2ehYf0tZ+4r2
	 k4qek43GufmzA==
Date: Mon, 24 Aug 2026 05:47:27 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Rob Barnes <robbarnes@google.com>
Cc: bleung@chromium.org, tomhughes@chromium.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] platform/chrome: cros_ec_proto: Fix deferred response
Message-ID: <aova74HsrEFQ2ZnS@google.com>
References: <CA+Dqm33C4x5jkDGzxwy-Poz-u135AJEh9PKCgBRvFMSz=M2AJg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+Dqm33C4x5jkDGzxwy-Poz-u135AJEh9PKCgBRvFMSz=M2AJg@mail.gmail.com>

On Wed, Aug 19, 2026 at 02:18:07PM -0700, Rob Barnes wrote:
> v3:
> - Rebase against upstream chrome-platform/for-firmware-next tree (Tzung-Bi).

It needs to rebase to "for-next" actually.  But anyway, that wasn't the
original comment...  It's fine as long as the patch generated against to
the correct base.

> - Fix MIME/email transport line-wrapping and formatting issues (Tzung-Bi).

It seems the issue is still there.

> diff --git a/drivers/platform/chrome/cros_ec_proto.c
> b/drivers/platform/chrome/cros_ec_proto.c
> index 1d8d9168ec1a..6d7c57e381e5 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -138,7 +138,8 @@ static int cros_ec_xfer_command(struct
> cros_ec_device *ec_dev, struct cros_ec_co

The hunk header shouldn't wrap.

./scripts/checkpatch.pl --strict:

#48: FILE: drivers/platform/chrome/cros_ec_proto.c:137:
cros_ec_device *ec_dev, struct cros_ec_co

total: 1 errors, 0 warnings, 0 checks, 251 lines checked
