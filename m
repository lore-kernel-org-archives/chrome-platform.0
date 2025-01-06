Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE70E2D600
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jan 2025 07:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736147195; cv=none; b=gGSyHncKYPHgABFIpxj/D6HsWxmbJXKPPydi2xXojAFH/vvKc29hF5h/gYZCxp0rLPn9DHUPWP2/FLTSooKFB3ViAnhf/33rJjbjVk2xUvrr/BArrcDJwZ76ojbXwQWvpKNXjM5uE9dZRaZ0p59lYZz1nbFBAxVcZ9P37B/Yt54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736147195; c=relaxed/simple;
	bh=lxy+6s29kP3ffdcw2HFmvvqWjRfQk9YRNJ6KI9BPJkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DTh7lRPz4RxbQu0CIuX6iOFzhteBqsDl0GmEdIu4ehhAXjevk7wGQD7O1DBaypzsmNiDCVND6gGHOPyl4bWjymEuqV9BwfQbKFom13dHboMnJeICvN1ybWjHi9ONsYsBvuEZR3a0QvA0HxldyYJRSwpTIeF568rn7E0QnAp8w3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPa+4oO4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPa+4oO4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C0EC4CED2;
	Mon,  6 Jan 2025 07:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736147195;
	bh=lxy+6s29kP3ffdcw2HFmvvqWjRfQk9YRNJ6KI9BPJkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NPa+4oO4U/LnJqUtyWWCLgX85soy6V6GxIFQVVUqSeSG7p74CX5KMzxkzn6H91ZcC
	 pCoZtFVd77I+g8FaqPhC+4nFM93Iq9aSiCBeK3AlEN3YZ/HPZPSkB3gt2D52RXOrLm
	 N6nklJk7XuvnplMJKQNytsshN6e4gXxvnoabuuTs2E72rHDGEB1dWwuv2HHWYqX5jx
	 qDINN2xHNE+MU07ljoKOlayV5NnoGqifFUNR1vnPOtWO/TUENo+MhwOr3kxgLZJqnY
	 WevVVwnIAkQLo1DGP13clpjfMfRUbExKhUjCqUluA/kRLND/c2XDh75sTnc9Ypn0Tm
	 HMS+v9vZd6Yfw==
Date: Mon, 6 Jan 2025 07:06:32 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev, dustin@howett.net,
	ben@jubnut.com
Subject: Re: [PATCH 1/2] platform/chrome: cros_ec_lpc: Merge lpc_driver_ops
 into ec private structure
Message-ID: <Z3uA-CykCvOArmU_@google.com>
References: <20250103001950.2868856-1-gwendal@chromium.org>
 <20250103001950.2868856-2-gwendal@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103001950.2868856-2-gwendal@chromium.org>

On Thu, Jan 02, 2025 at 04:19:49PM -0800, Gwendal Grignou wrote:
> MEC support still uses global variables.

Is the sentence redundant?
