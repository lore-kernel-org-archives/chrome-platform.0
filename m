Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9605D231A35;
	Mon, 13 Jan 2025 07:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736754255; cv=none; b=A+aIZqWX8YFlJSZSgUzWiach7jI/xvbtxMtHxFr1xTD627zp1MdKPIHDDenHiLrgWGQlwq7+VZxETwHCsiKpmavMfP3bx/uTEm0rzjJIQHerY1LXndoI9jFOFJ4hGAgZtfQjHvvh2tBFlzhLsyPSAmn/vGXbcoOFY7yNVt8+iXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736754255; c=relaxed/simple;
	bh=90N18/vpwyaN9NUZHFTR/LZu/AKZjRuIIJQOE/rPvYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9FMoQJiUt3pkp3YiYhicfB3+ULkogk6i33ugj4QoTPurfkgHshbvhkq3d7fXYA5AADcrZXngVQSnMRxn9cdAH6HfwFkE1jQy3xjP9fBxPo7IQJrYDpEyomaveqXrYEk+1EYVt28rzdEoFqb+nE6yRtvHaU+96leHqgcj1y1JwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWaT6zny; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWaT6zny"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31AA1C4CED6;
	Mon, 13 Jan 2025 07:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736754255;
	bh=90N18/vpwyaN9NUZHFTR/LZu/AKZjRuIIJQOE/rPvYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KWaT6znyw7ww3kAu5bTpwfRuVkNHg01SfEDrvZx25FjcbTsinXDmsDPOpFJgqn7ak
	 7NiwlVR+qRgnTLNT66hsDzZ2jlPR6XCCV52ypWst4uAKuIs8ptG6Am7mFLWAYDcOzE
	 UgN0YmC+O8qGBMzLs6XKvfLTeQ1D3prvBCUUuAumhiyPPF9Uy00UuS1yYyrFoE9xhl
	 TlMqSFvYjC+UjRuTFOc4jSVEvyZ2yDedSvmeXBebLvBMUCte9x2RVY98pL18yEV5kF
	 T932FjPdSR7xb4eqxASwbtJ8GGscc8jaWKv0nnin6SMYnjUeNL+xAqBd0DvpncMek4
	 lqKjspVgKgcGQ==
Date: Mon, 13 Jan 2025 07:44:11 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_usbpd_logger: Use
 str_enabled_disabled() helper
Message-ID: <Z4TES6OLaJ7y0upW@google.com>
References: <20250112100655.55741-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250112100655.55741-2-thorsten.blum@linux.dev>

On Sun, Jan 12, 2025 at 11:06:55AM +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_enabled_disabled() helper
> function.
>
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: cros_usbpd_logger: Use str_enabled_disabled() helper
      commit: 15fa0621d7b389effbf09e94b765e828f931f8c0

Thanks!
