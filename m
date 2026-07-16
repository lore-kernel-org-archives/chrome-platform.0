Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008DE2DA759
	for <chrome-platform@lists.linux.dev>; Thu, 16 Jul 2026 02:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784169810; cv=none; b=NP/iah3GdH2KT4Cdc3DFD5ZWUeGO20tL1/+lKyo+lAYkqSnKIDV/fGqGDMlN5k98DguJiQn+JELznx2EBckTERHfr5/HkscsUgWAAFG/RzAn7JD9JFXhbf7+x5e8/WkREBFRltZwurC12G38dVt+9oUHj6DXAGy7rKE4XFfpQFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784169810; c=relaxed/simple;
	bh=UeXVqg3kFA9mRqu3dnxKRdI7Md5iq8/yg7R/zTLVE1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8Ebj8GBRo2/67haRvIBVCs7edq55I11JiRvGt6zDNJTUmNGv26EVCIfNhEKWs3C2dA4ZAQ+EB3+Eqou69khBqvtwg7AF6/2IpT4JWGAgaQXMe7ezv9WDuvIFoouYHjWKTEvmVRktV0fqfKKXXds0AZY6QBP75JthALbPOEq5lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gXlzQiVt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gXlzQiVt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE53F1F000E9;
	Thu, 16 Jul 2026 02:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784169809;
	bh=9xjpEwQlPZcRMRKeP6qwRyJlcrK8xC7rZS9lf8FmGr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gXlzQiVt58KIpRndy9oRzl1co8cNekK5L7QseJF4Nhpouuoas9D0BSqAiV+c//M/Q
	 7BKZ9zC3j3BfiNn5v0lxOomPHSD4pAHxO7Z0CqFlNaoUOZsVn0laaAR8Fn5lVBt6Ne
	 6d9yUrvpjFSOFN3uf6Yk77T8M8eC75ZI78ebbc0fndoHRXQJ6+UBs4OK7kO5Yje0hJ
	 mcF8jXO/u1+kuNXh6K8YIqaQ1Z5prkMZi1KC9N0xsFS+njq15+p97Cb+e2Ldg317oc
	 bcFxM/i4ztBA565wBZ+5ZaUw+PYkyVSub4oeapRmCAaXYs4yFzBHcoPFQLxJ9Pn3bk
	 a9iYzIqDNZCdw==
Date: Thu, 16 Jul 2026 02:43:26 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>
Cc: Bryam Vargas <hexlabsecurity@proton.me>,
	chrome-platform@lists.linux.dev, tfiga@chromium.org,
	suleiman@chromium.org
Subject: Re: [PATCH v2] platform/chrome: sensorhub: Fix dropped timestamp
 events and log spam
Message-ID: <alhFThEb_Mq3zDW7@google.com>
References: <20260715024454.4127571-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715024454.4127571-1-tzungbi@kernel.org>

On Wed, Jul 15, 2026 at 02:44:53AM +0000, Tzung-Bi Shih wrote:
> Commit 833740a2333c ("platform/chrome: sensorhub: Bound the EC-reported
> sensor number") evaluated the `sensor_num` against the bounds limit even
> for timestamp events.  A timestamp event typically has a `sensor_num` of
> 0xff [1], causing the driver to flag it as invalid and skip to the next
> event.
> 
> As a result, we'd see a flooding of "Invalid sensor number 255 from EC"
> warning logs and these timestamp events were being dropped.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: sensorhub: Fix dropped timestamp events and log spam
      commit: 9a3f43b30373c61477d0d3ab52946c05f9492bf9

Thanks!
