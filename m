Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDAD36167E
	for <chrome-platform@lists.linux.dev>; Mon,  2 Feb 2026 13:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770037807; cv=none; b=fLB5b6qE2pICYXKuEYlKX3iciARpo3f+LqkP3tJDg0VpBIQdFtEtRhPIj8VxSpvoMs8CTJbiFdR7knZcuIBbraMVNY00FkZ0Z5QQiPXWpDignpmrpimgXzXymdUOOZ4Uyfm+Gwfx1SdUWIHF4XrW2tjaZ0yNcPWL5vJoaLPebdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770037807; c=relaxed/simple;
	bh=yOxQ75HQqmC/cnQRRCpp7T1mzbbAYYYdJvmuhvAuiLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sC2nNNWpO4ZjxiqB206K1q2CeCtrVB2pP4Z2PbzFR+t+sI+ae3KK8BPjGNsMqPtHQcojp1H03A8dy+AEmmvp6VjWQ1OfAox0VWRX6oPDohfr6Ot4Y5O20O6B1OF3fUDgA73oOGEuQsgf+RrI178uz3NXXdW4euo9IVOWGrfgqkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AbC4mOi4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AbC4mOi4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD59CC116C6;
	Mon,  2 Feb 2026 13:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770037807;
	bh=yOxQ75HQqmC/cnQRRCpp7T1mzbbAYYYdJvmuhvAuiLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AbC4mOi4v6a3xxcVjRCWSdFG/Dblv3mIuHlLrZQYuhf3IzurGY/Jv3rtAgaUFnHz5
	 DrPD55JeH1gWTvmrgJIJtsrOvvneYqHGhsRnk4Fa5IajV81J1R/W+1k5gs3/rAwpXU
	 jE1jp7227beFcG4sz/OqJiXIM/bWX/RqZIUj9HzUPE8XqexMDwwYqci7Tul9h4HptA
	 dybSPegR96GHe99wpzGnOx1PZ0nSzTzznkUtnEUy6SxPA9KxgupT9gOOslu+Jk09Lc
	 jDUU7cjz4AXShikVRMGHK7mfF4fKL11D25V4JLhBkK/93r2BPmUNDSLt5qMW6mg6VW
	 /n4lkpTSY3zqA==
Date: Mon, 2 Feb 2026 13:10:04 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: chrome-platform@lists.linux.dev, Gwendal Grignou <gwendal@google.com>
Subject: Re: [PATCH] platform/chrome: lightbar: Fix lightbar_program_ex
 alignment
Message-ID: <aYCiLONNTvtjtb6h@google.com>
References: <20260202100621.3608437-1-gwendal@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202100621.3608437-1-gwendal@google.com>

On Mon, Feb 02, 2026 at 02:06:21AM -0800, Gwendal Grignou wrote:
> Make sure sub-command of lightbar command starts with a 8bit
> parameter to ensure alignment.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: lightbar: Fix lightbar_program_ex alignment
      commit: ff6ff0f950066fb84a6d9358614d18d7280d1b6a

Thanks!
