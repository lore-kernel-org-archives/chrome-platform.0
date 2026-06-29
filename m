Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D6440D58A;
	Mon, 29 Jun 2026 02:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782701449; cv=none; b=mrGyDkfhmPeIQJrw/T0Ca7bUE/t+Ua+tuOvb4ZGR/XhWHzLImfaxmua1NRG5jCZT1jNieK0aZkfl6ZSRrcZ7V0m+SDa3OjnJ9UzxZ2gpA8TC92TJwpdHi42pfm/E0/rwERlsI9AihAJow2dacbfyE66U7wxHfpntHh7rEdJTZ3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782701449; c=relaxed/simple;
	bh=YCgNj+V7vl04lkBYG6wQHTNsXrUWDALNDQv5ft8ZMaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4eGnzP5micdTuFczFQgzVLVpEylboKM8Nby1GjEwb4LkThhrsG+L4GC4V/kyMgIVp7ahyjJvOygacQZLiJLeXvlbOhf6AhjIxiSP8QjSeffEEej+NeA2Up2CoAw0iC07EPDenxwlyB7/l+Ssm2y2r+SfhhTRLh82Fs6JFGQED8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fTgelhrv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fTgelhrv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16731F000E9;
	Mon, 29 Jun 2026 02:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782701447;
	bh=9nxTbC+sojTLb2YLK6xI+ur48ZY10xzfxGdYMqQRQa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fTgelhrvoDZJKo849nXp6TE87k0mHkdAOL2PPmjrK13pm81P8q/Zm+7BVcCKakvYV
	 bmzmnsFXvwCNzQ+fLh10vgwePUPu3SeBFJkgGWxe3T4Haz/Dl46+08GjjJSndDR0Fa
	 ADg7ykjXYLtjcBFlevGCnfgprM62mY5oeSUVLeE9ZZaBAA6ZfZlos2X9sQGOshqxkj
	 B2bvqTa5S6zg3XUh4dvTjZ4+Auu8bbf3Aj8k9DWdFWIIQ4YcAG3bB6NquR0JAJqTZv
	 IvfZ5d4hjoBlR2l8rnC//O6VDjvveVaTpHZ/Telqzt1TtrhnGnYkN9XlDJ6A/QxA6l
	 79agfEI1jgi3Q==
Date: Mon, 29 Jun 2026 02:50:44 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: hexlabsecurity@proton.me
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev,
	Guenter Roeck <groeck@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] platform/chrome: sensorhub: bound the EC-reported
 sensor number
Message-ID: <akHdhHQsc0si8Jor@google.com>
References: <20260618-b4-disp-adb3f790-v3-1-3a164ed63cbd@proton.me>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618-b4-disp-adb3f790-v3-1-3a164ed63cbd@proton.me>

On Thu, Jun 18, 2026 at 12:46:28AM -0500, Bryam Vargas via B4 Relay wrote:
> From: Bryam Vargas <hexlabsecurity@proton.me>
> 
> Each EC FIFO event carries an 8-bit sensor number (in->sensor_num).
> cros_ec_sensorhub_ring_handler() validates the FIFO event count, the
> per-read count and the ring bound, but not the sensor number, which
> cros_ec_sensor_ring_process_event() then uses unchecked to index
> sensorhub->batch_state[] - allocated with only sensorhub->sensor_num
> entries. A sensor number of sensor_num or larger is an out-of-bounds
> read and write of batch_state[].
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: sensorhub: bound the EC-reported sensor number
      commit: 833740a2333c2e4db4e02e3d0ffba04e8718a5f3

Thanks!
