Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D16B2C11FE
	for <chrome-platform@lists.linux.dev>; Tue,  3 Feb 2026 02:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770085485; cv=none; b=fH8/BvVp2GPIBCBPCpXKNcW6nJgbClaW2CJOn7r3QbW/+ltTzB4o8EDRZrXyCLs6387tsjx05YSCtyFEFqOHUJ4Iq3jIuyNIS/cJQNCe0/+mDgWf93hMDltyV9o9ZwWvTE3F/1N8hn/FT/m6m9/6Cu7zfhYwFk5KYiGrub58Yg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770085485; c=relaxed/simple;
	bh=7s4uWKpo+/4IrEd4YbkHa0XDK5bSLnDpNUrLW+/wzM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7LlZujUp+x/P1TKR/4g1wGizNINuT/x8qWgQ11XtK48diTccKij5uWyZIFSZbafC+zuPqmCnl2kf+g/RtzA5w/KtR23TgSfl1mPLL17WeOwDTF6KRmMGYYBiZzVjli3RDfa7hEYtdAmTvEw4WK068uSPGyd7FnKt3+Vg8kT3cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PbwIKhA1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PbwIKhA1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA78C116C6;
	Tue,  3 Feb 2026 02:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770085485;
	bh=7s4uWKpo+/4IrEd4YbkHa0XDK5bSLnDpNUrLW+/wzM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PbwIKhA1KBlZ7Beei1/pdrMzpAx2ESa1bvsDWNNZ9N4iMpyTmJlsAdmiGB3Pw7FMd
	 8Ys+8i/TgvJ5WAbfneKWRkOKv21x60ZBhJdwcgJBVPHV7NdRHGzci0pXYR6puOvfHf
	 Cma4LvdT9pcqWUd2I3LLKTpEBfvUSZYnZToFsUuzxIY/d/uF7eYv015vAajZVA/oXE
	 f5VvtDo//WYyGHPDAT68QroFLaQH1c3wH84Oj+dX2Jth3Xvaz+M62koyd4VXWyIM9P
	 I8elBzlGXKeAtgv7eRJ+ZZuQgNgkLu4PW41TpXwsGfe2Cc5yjNRbVe4LRCgGMBg5bS
	 Pn7+3OjkU9zSg==
Date: Tue, 3 Feb 2026 02:24:42 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: chrome-platform@lists.linux.dev, Gwendal Grignou <gwendal@google.com>
Subject: Re: [PATCH v2] platform/chrome: lightbar: Fix lightbar_program_ex
 alignment
Message-ID: <aYFcasfnPM9FhaZm@google.com>
References: <20260202202157.529680-1-gwendal@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202202157.529680-1-gwendal@google.com>

On Mon, Feb 02, 2026 at 12:21:57PM -0800, Gwendal Grignou wrote:
> Make sure sub-command of lightbar command starts with a 8bit
> parameter to ensure alignment.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: lightbar: Fix lightbar_program_ex alignment
      commit: d55493f6d2dae3a8e8b50fe82e947781a7735c51

Thanks!
