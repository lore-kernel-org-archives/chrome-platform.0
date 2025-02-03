Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245F1156CA
	for <chrome-platform@lists.linux.dev>; Mon,  3 Feb 2025 02:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738550681; cv=none; b=QIA/HyhfO4vdWRJxo7fUqhHYO+rlOioZ2j09EVKeLnAW8GI1oWgwA2s28snPcHs7d3hJLeJg3BLmA5Qgu7aG2JLV1WAvpKhWANffe/IYI8Snzp/vTXLHeBNWNlpmkKTntQbchJe83XV78nC294Eh3DO1p6KD3CzT9V7JoYIu8I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738550681; c=relaxed/simple;
	bh=T0ScFBH6t1PuRqUQbrpTW1NQCXtjtwBAN/6ysLRLPrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrvTprl4oY1j770m1dUiJgsuBpsrCQOOKIT+pG/dB9BwG11VDv+ySQ6acRypCXur+C5cFIfHg3OFw4x9lHc764J7O/gD1U8g25+PTZ8TKe9VG44lY4D28EW5bHKWESL7uCYRSjQd4dWMpCaKnRjOS90dEfUXSLVNIwaHL6XVrtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KimXPGBe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KimXPGBe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 922DCC4CED1;
	Mon,  3 Feb 2025 02:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738550680;
	bh=T0ScFBH6t1PuRqUQbrpTW1NQCXtjtwBAN/6ysLRLPrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KimXPGBeO1WajbkMKdgY/qtuWrQ+XERL4gtiL9WRckkmGNSl0id0aR58AbaRVXwVu
	 +qAl/STPW/FkQb3BSYbk4QNL7yY9DTLpMmL7uiamCxbZ9rXQFX7mq4dMejrv0AhG0d
	 Pverxv/nc27yBsQVUHKuV0l2gyJGiz6WWlH4CuGaWXvEKn18QbGtbT80M0fyXvkq9e
	 dIa+jlPIYOP40wYGzdjnpxz3oWbx7Ay99nCqQc7UBS5JhVSX8xllveKGgnkBO8dQ+P
	 VwOv4X7q37j7Q4rKFv2KKr3wh2h1gTXElrvMo93dpf9iib2v8Fiye30fFlyiOst4pC
	 UjhYVwW+YeXEw==
Date: Mon, 3 Feb 2025 02:44:37 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Daniel Schaefer <dhs@frame.work>
Cc: chrome-platform@lists.linux.dev, linux@frame.work,
	"Dustin L . Howett" <dustin@howett.net>
Subject: Re: [PATCH v2] platform/chrome: cros_ec_lpc: Match on Framework ACPI
 device
Message-ID: <Z6AtlW7FwEwHMztW@google.com>
References: <20250128181329.8070-1-dhs@frame.work>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128181329.8070-1-dhs@frame.work>

On Wed, Jan 29, 2025 at 02:13:29AM +0800, Daniel Schaefer wrote:
> Load the cros_ec_lpc driver based on a Framework FRMWC006 ACPI device,
[...]
> > sudo dmesg | grep cros_ec_lpcs
> [   17.521972] cros_ec_lpcs FRMWC004:00: loaded with quirks 00000001
> [   17.534012] cros_ec_lpcs FRMWC004:00: Chrome EC device registered

I believe it's a typo.  Fixed s/FRMWC006/FRMWC004/ in the commit message.

> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: cros_ec_lpc: Match on Framework ACPI device
      commit: d83c45aeec9b223fe6db4175e9d1c4f5699cc37a

Thanks!
