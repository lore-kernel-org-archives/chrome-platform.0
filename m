Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E992230990
	for <chrome-platform@lists.linux.dev>; Thu, 21 Nov 2024 00:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732150501; cv=none; b=ukBkCIDRhXMgDkcwMDse/X6j1A0nkFLdxmmC8tnplRDzaDmkavFoL/NtBJxzxIVLWX+xAfz0s87tA8sJvuTFzKi1fNuan8F0jO8ffWp+20pwQ5WjaQiT+3c8Ms+8XOOPa8/M7XBXwM/CRHnjzxS7X33FpWs7sosS6NDmAaYxpDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732150501; c=relaxed/simple;
	bh=Vcqu0HUUkjR5DzubC9ke8ZJXBo2PdRicRXcIe2jPFzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gw/6Pureb9N4XwVdKQJ1koTekgtNo4S+s93r+CmYDLrfM4lcY9w3m6x+fusVU5si5/uuUdw6ONYQh1FHk34ZO8y2iI855+7UJFLIYP8+ZxvIKejUDpEgdbjhdN44DZsscdx20qZxbUJ1M8Fldncz4Vm457rHZeJ1m6gTSYETexI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJLvEVIC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJLvEVIC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13AB4C4CECD;
	Thu, 21 Nov 2024 00:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732150500;
	bh=Vcqu0HUUkjR5DzubC9ke8ZJXBo2PdRicRXcIe2jPFzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AJLvEVICpmJ9eo5jLBTB59MntMj9tBQDh5vCYWqW0cNoarUNzwEguTw1rtuE7giM0
	 bFPvC3nMkiOfnzoFXpBaYbH85+enSMfLsNjZsbbRGCOL0YFa+jUV6JXLxTO0ZZA/EX
	 sMXv0NKArscZq1Ak0p9P292R/BDRQkg5wtTGk6JN5komlP4QYl/JGRGWhySTAN0BWv
	 V4G+ZKvkBzl7lHHKgpKYYmA0IQ4vNZWChILqDr4u9p/kwYnRzyMFfLBi+atVOg8pak
	 HpFqS9ARN9qLa2ejEyR4K9pIisUiOKQqEGXVFUAuOVYtLy1Nv6uT6b14WSN5/oam4v
	 kz2GZNQTdjB9g==
Date: Thu, 21 Nov 2024 00:54:58 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Brandon Casey <drafnel@gmail.com>
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH] platform/chrome: cros_kbd_led_backlight: support Google
 Link
Message-ID: <Zz6E4taK4VpXbeac@google.com>
References: <20241113023800.6263-1-drafnel@gmail.com>
 <20241113023800.6263-2-drafnel@gmail.com>
 <ZzRLOmDCOrCa5DJW@google.com>
 <B7B50D15-7465-4370-8D82-47C75A16A3AC@gmail.com>
 <ZzVbbh86elpYQG5s@google.com>
 <439FC80F-141E-438A-B201-772C9509D048@gmail.com>
 <ZzW6mz9TGc8bglOi@google.com>
 <EA9C2C4B-05C8-46D7-8B25-495377413347@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <EA9C2C4B-05C8-46D7-8B25-495377413347@gmail.com>

On Mon, Nov 18, 2024 at 12:58:52PM -0600, Brandon Casey wrote:
> You seem to be suggesting that my machine is in some odd/abnormal state.
> Do you know whether Google has actually ever pushed an updated firmware
> for this device (LINK) that included the patch referenced in [1]? If not, then
> shouldn't my machine be considered to be in the "normal" state, not the
> oddity?

No, I don't know.
