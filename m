Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE40175A9A
	for <chrome-platform@lists.linux.dev>; Mon, 27 Apr 2026 02:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777256857; cv=none; b=EHOc8HxOZpLcBBNXN/LthFJaGJawiJHoIAxjMiDkC6bvaFc85XPS9U6S9/uJfA1ghCkWEp+GI940ZHkTlWn4ptQn4wpAWE7CPPwFgEJPM4opanwl+v4HcqxkzNktXkskZecFnMnU6DntkhfTBuk4rFssuUtmHww/UMnTUi40E2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777256857; c=relaxed/simple;
	bh=j9dch4Kf1i/DxjRle5T6ruVJLOXQqO+ocBIZ/hnIp/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wv7xIvXAiTVl4ZCHOWoSDGAXz4h6Dv1AOCHh/7i0hzIso6TG0g4BqWkgjoZAW3iVkfoYc4nkuJtgiz6GXoKloVF9raJsBRVgo0OJGrKyoRLaJl1ejhgZl/6fTtYSPnv0tteBcajTnAtDEmA+ofA2mVVQNM/h1/1ddwUX1DEka68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QFEteD0a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QFEteD0a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3C9C2BCAF;
	Mon, 27 Apr 2026 02:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777256857;
	bh=j9dch4Kf1i/DxjRle5T6ruVJLOXQqO+ocBIZ/hnIp/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QFEteD0aBQ7up/LsIzIXLE7Weba9io8erbzqt5BDKr+1vI98l5p7cgVFuAynCGGGO
	 vmua1JPEydv7Sf3NsjhWzoqu8j+k0D7ScyN3ToypL2G0lZDLmp4upyLLtK8uD5W4wn
	 Bet6BrIvfv1ESXLVAQ/LA1GDmge0XrKcx2t4AZLlnpB/t9aLB2DB9/TDKcNnsO/zi2
	 QTO1CYqJlWwva9QyZGfjZgwonowpQDbm9YQx73qNjGDH/HRknylg63Rona20etZN6u
	 kwanL1t3sDLK4qXVsCIXlZtPtEi66Kl29VR6T20bg6bIV76So+pPKaleOz8O1LT3L6
	 vAI37gaFpqGJw==
Date: Mon, 27 Apr 2026 02:27:34 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org
Cc: jwerner@chromium.org, chrome-platform@lists.linux.dev,
	tfiga@chromium.org, Gwendal Grignou <gwendal@chromium.org>
Subject: Re: [PATCH v4] platform/chrome: Resolve kb_wake_angle visibility race
Message-ID: <ae7JlgtvSUuqfCWV@google.com>
References: <20260407102615.1605317-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407102615.1605317-1-tzungbi@kernel.org>

On Tue, Apr 07, 2026 at 10:26:15AM +0000, Tzung-Bi Shih wrote:
> A race condition exists between the probe of cros-ec-sysfs and
> cros-ec-sensorhub.
> 
> The `kb_wake_angle` attribute should only be visible if the sensor hub
> detects two or more accelerometers.  If cros_ec_sysfs_probe() runs
> before cros_ec_sensorhub_register() completes sensor enumeration, the
> sysfs attributes are created while `has_kb_wake_angle` is still false,
> hiding `kb_wake_angle` incorrectly.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: Resolve kb_wake_angle visibility race
      commit: 79b1c32a3faf9ceae365f56de7e962b81fa8167d

Thanks!
