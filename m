Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36C978F4C
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jan 2025 01:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736127064; cv=none; b=ghvQ5hYL1XGXuzJBBHjLHrcJkC8YHRDU8Q+sv9+mHjEYcS2fE/GsSNYeD4J5s8j0sKxdAh0OBDVXkhjOOdU7QEJRd8RQnYPEC0KEGZZaZfNN2ufIGCOna49vLTFr7qJoeHeIH2hxqzzXx2GAtY4Zx7aFblTtNQXb4QfTCfOGCgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736127064; c=relaxed/simple;
	bh=IVRGYSHxBorkzJ35nX8O1iWI98WS6ygisAImlm9blzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLpB/6TckU+O3M3B60l0QpOz98bxIwMuQ6lEh0qBcqZo8bzkOYVYEh815tYNoPV4FI/vLfYzMfQcqwPxjHQjVfMnyZzjvcitb7ZdUKl3z4FiKiEiXpiVF7zEF1+hnbkVdqv9xmoUYeziL87FqREkZy9Bmpx+EHKIBzG50Gx543M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TOnIyOJj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOnIyOJj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D08C4CED0;
	Mon,  6 Jan 2025 01:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736127063;
	bh=IVRGYSHxBorkzJ35nX8O1iWI98WS6ygisAImlm9blzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TOnIyOJjRgK7FIei8Nmcgv5a0RthcNS2CbRcenMx/hJCY6W2GlSIQt/MUudQo5Iuj
	 h3ErQT/m7X8Dm+6JFKovvINdCAtW0q2FXk5Y0MfawuqZAsM2dFxcf0FFYFFsvEgOhY
	 aCHpinx63yodfFJAYto6eUH7rtRRcIGOMsxHnEtAOzpTApd13fpHgQhfoGOpgNkLml
	 6hG3scmu0PUeRGgpvn7vnM7VXk9rrcqxxEB/AybpSvuFkjjwUuL6BHMNzJ9alW5DW3
	 qv4LqjDO9oXDvQ69N1lMxtdGac1yQWpl6nRqmLFJvBvV2CMmMMi49G8PSWnark6ARn
	 TgPzS1xkcTT6g==
Date: Mon, 6 Jan 2025 01:31:00 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev,
	dnojiri@chromium.org, utkarsh.h.patel@intel.com
Subject: Re: [PATCH] platform/chrome: Update chromeos EC command tracing
Message-ID: <Z3syVGzFp9Hv-5hW@google.com>
References: <20250102210456.2399245-1-gwendal@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250102210456.2399245-1-gwendal@chromium.org>

On Thu, Jan 02, 2025 at 01:04:56PM -0800, Gwendal Grignou wrote:
> Mechanically update tracing with new command:
> sed -n 's/^#define \(EC_CMD_[[:alnum:]_]*\)\s.*/\tTRACE_SYMBOL(\1),
> \\/p'
> include/linux/platform_data/cros_ec_commands.h
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: Update chromeos EC command tracing
      commit: df78050d1a1338dd3e07db959b42c2d03969ed30

Thanks!
