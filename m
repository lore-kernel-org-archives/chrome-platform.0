Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8833248F4D;
	Fri, 14 Nov 2025 03:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763090402; cv=none; b=AQZ22skOJkRx1Dkc+5DPOgrMxCSSbqLaOY7sAonxYf0d/n4q3WKyD0RQGobZ9IaGV6EwxZYDjb/PGWp3kCuW3/Zhs2Crsu5lZklSxzxtpVmDyA++22KsiqmIHGMehXQ1eZspvdYvf1WNULRmtxLKV//wLYPuQaDhaHAN4/sbZAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763090402; c=relaxed/simple;
	bh=M8lbtnKHsUFf+hCg5uQwMZkyr4NPBotVY7h8m9n5RI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZ7/lGC7GuAnIKMNbCngG+0JOTjJGCxvUPnlHUAp1wH0VbG/PBydmKyAnqWIH+k69J/k/V4leYJ7snsf7ka2S4KBAcRI14mvHbdL1d5BbfKGWS6cIJu1ZZJVRrSkJsBc3P2HMN/dGAuLc/fUxOQF4p9hTcN17mH8LflnbhGkZ3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJI6QsDg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJI6QsDg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D6CC19424;
	Fri, 14 Nov 2025 03:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763090402;
	bh=M8lbtnKHsUFf+hCg5uQwMZkyr4NPBotVY7h8m9n5RI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VJI6QsDgbDtfhBEY7DYi7O3c38Rsp1sSSnSPKkeCRs0wERTiy5lbyfa+xS+SRIf0v
	 vnvzKYsY+3SYOGh2b9InAFaUkKFJSUUlPyvoDO0UWR+KDE/P8X1/Vz8WbRPLNAPtu2
	 eWRondFkZgDucqoe+AZgKyJ00zTs4p3rNxTBrBQvCrjNn1h0jnKltdn8DznmPer/DE
	 QoI3jtNvbsN8vlqyhcXyhqW0CVCBrcxs3si5Xz2EBc1b6q7twUmuv1mm/5oY2VzUvn
	 SRBh6zATB3URhunZl6i3GlPrYdZGqmglL6O+5zEizvKbNx2LiBxuyCEuReUEnmHfg5
	 sOg/3rOD+rieA==
Date: Fri, 14 Nov 2025 03:19:59 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: sensorhub: Support devices without
 FIFO_INT_ENABLE
Message-ID: <aRaf39MnKjA3q6iL@google.com>
References: <20251112-diogo-smaug_ec_sensorhub-v1-1-f71d4e9eb9d4@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-diogo-smaug_ec_sensorhub-v1-1-f71d4e9eb9d4@tecnico.ulisboa.pt>

On Wed, Nov 12, 2025 at 04:00:12PM +0000, Diogo Ivo wrote:
> In order to fix this, since the EC does not provide a way to determine
> a priori if there is support for FIFO_INT_ENABLE send this command
> unconditionally and carefully interpret the return value -EINVAL as a
> device where FIFO_INT_ENABLE is not present and the interrupt is always
> enabled.

Thanks for looking into this.

Simplified the commit message and some side notes:
- -EOPNOTSUPP[1] for learning if a EC command is unsupported.
- FIFO_INT_ENABLE is a sub-command of EC_CMD_MOTION_SENSE_CMD.
- It likely falls into [2].

[1] https://elixir.bootlin.com/linux/v6.17/source/drivers/platform/chrome/cros_ec_proto.c#L22
[2] https://crrev.com/30c5bc8e822436e6a74b36adc24d71293a5ba9c2/common/motion_sense.c#1438


Changed the commit message and code comment, and applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: sensorhub: Support devices without FIFO_INT_ENABLE
      commit: 52075d2c7595cfd6c1ce211a9cd138a9b067c448

Thanks!
