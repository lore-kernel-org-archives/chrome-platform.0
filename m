Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9077F27A476;
	Thu,  2 Apr 2026 02:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775097064; cv=none; b=LiyHBLYOZXEUJe0D5we34ZuRaoLi5M54d3hOIPfpYSolotgPJC/2vuvO+rEE3Ao7jflfz6Ypv8tPuiPj0N4m02Bk83MAJYmdWbzpBOhemUAMTqD7meK0LIvajHT5h6UATwNIhBWAaowbCMksP5/wy3X6s2kjG1IMtxt6kfm6KUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775097064; c=relaxed/simple;
	bh=h+o5LhJwQEtFCr8mUPCAbEAeNjpm7jpujzFEHntc3t0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8agcmwGgQjNZLw2fG5hMfzTlWeE8b3JAC0RylnqDW2goX+Pj2K04kVfzVLGOlF/V7Fw1q7Qf3vfwB8ujm93RMqrpKQon2o1SMJj/YSmElmvFS43+kOMQL0TrPxxGf/a+1un2JKQxI3ALyxmzf1L6iiN5QGAn2ubr42Qf7u5hJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WI0v/ECT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WI0v/ECT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F079C4CEF7;
	Thu,  2 Apr 2026 02:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775097064;
	bh=h+o5LhJwQEtFCr8mUPCAbEAeNjpm7jpujzFEHntc3t0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WI0v/ECTfvBftFAiAoyQnI+p3Dbq/3DIReUNGQVW13Oyu0TDYeX9r2uv4c08jiWuT
	 V+msvLubPcN6f1nMdC5rWHT/3qjLx3lDyMIeQcs9gfzG/IYMXHJBtpaBuyb7J2qU2F
	 FQg9Zbci1xVT3iaL2DdpldbzwiSuAQ4G9QaSVhsXmaigprAuAS9b1pf2EaKzLaUpZI
	 UKaqgCZz+7VUps8lTK0noqpY2DfoycACgaRLfbXsO2ZygHYYnvbjPbnnAZ2vI0Ml4b
	 u3Y6nsp91lPAtRO987cZmAnkQdlk25/Y6tamlJjnWXnJLzhY6rOvKfbRJXzSK+ED8g
	 2/OHwlAUQXRow==
Date: Thu, 2 Apr 2026 02:31:00 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Wang Jun <1742789905@qq.com>
Cc: Benson Leung <bleung@chromium.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Jameson Thies <jthies@google.com>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn, 25125283@bjtu.edu.cn, 23120469@bjtu.edu.cn,
	stable@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_usbpd_notify: Add NULL pointer
 check for ACPI companion
Message-ID: <ac3U5Kn6jap5RtWU@google.com>
References: <tencent_B1B3C1F57C046AEC80A8218FE8AC43FD590A@qq.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_B1B3C1F57C046AEC80A8218FE8AC43FD590A@qq.com>

On Tue, Mar 31, 2026 at 09:10:44AM +0800, Wang Jun wrote:
> In cros_usbpd_notify_remove_acpi(), ACPI_COMPANION() may return NULL
> in certain scenarios. Directly dereferencing adev->handle without
> checking could lead to a kernel oops.
> 
> Add a NULL check and emit a warning when no ACPI companion is found,
> then skip the notify handler removal to ensure safety.
> 
> Cc: stable@vger.kernel.org
> Fixes: 7e91e1ac60bb ("platform/chrome: cros_usbpd_notify: Amend ACPI driver to plat")
> Signed-off-by: Wang Jun <1742789905@qq.com>

The patch makes less sense to me.  The device is matching and binding via
ACPI.  The companion device should be there.
