Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE809364959;
	Thu, 30 Jul 2026 01:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785376121; cv=none; b=F8xTJ5+4ltVJ9MHU6lBV+hzQ9MFhjwUNEKWRVGYMdC15DG8gB4m41xsFbOXKgIwn/bwPxqqpEK4q0qVL75Pj7FIefRHZJh8BaOcVN8pRbtOy09/hSPcWz2XAv0n4P4StjH5SJz59hFWJ13DZmyFKNTxEW2spUPg5x169qGhAku0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785376121; c=relaxed/simple;
	bh=9cPGh2sGcuviYdewuWGDGVnex0U9gTPA8DnDSSFpmuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qBE8DgGKIJ2MpxvMmx39hvJxp1vTt0aCxtTeP00F3bQq+TM86sDPCJyKSsfgb0lUAU1DWoJ7UwLplitCdpr7ZVFob1ME8XlRJ70X5eCxgeCAfgcZ/AKjzD+Il3W5ylkxo0JhFW/peWjzaNL4edcOdEb3IPlHrwPs0CWDmqbAfZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZuuDOou; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZuuDOou"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 747991F000E9;
	Thu, 30 Jul 2026 01:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785376116;
	bh=sfx09IulGR370cmr8UMO8EldA//Hf6a4K14ZWlX8Dgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZZuuDOouHBARRAG9qbGOsKV6lnv3R3WpMiUXJDbqyd8MlW3IZN8UgWVUlfEp0wEDm
	 OoS0o9GF3rPL4fP1jSqrQVzAacJBmnUmiprauPEnRTnjqInM7zBeM4zmpxFaVVVXQ7
	 Aj2lCBPkcDl7UonAisdTMzAc5N8WYgREdG4NdeX48+m3dL/Nd52KllgAtBpeUQ5gjz
	 aZoXkEzv00suGmhgZUyJ2ni0KKj0dLL9q33kCujbt/KJtSy8Xg6g+SITVnYN2AqdF9
	 uSg9x1yj9fDkm7AODc+g7BBg+5vxhVT2gRRH+bZxrXvNutRvLEi7jHU3TkO54EjnZn
	 X2KSvyJkRSdwg==
Date: Thu, 30 Jul 2026 01:48:33 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Hongyan Xu <getshell@seu.edu.cn>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn
Subject: Re: [PATCH v2 1/2] platform/chrome: cros_ec_debugfs: clean up
 console log on probe failure
Message-ID: <amqtcf3VEoi0tIzw@google.com>
References: <c00974953a1b952f51f0f021d7f9fad134159909.1785320940.git.getshell@seu.edu.cn>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c00974953a1b952f51f0f021d7f9fad134159909.1785320940.git.getshell@seu.edu.cn>

On Wed, Jul 29, 2026 at 06:32:16PM +0800, Hongyan Xu wrote:
> cros_ec_create_console_log() starts log_poll_work when console logging is
> supported. If the following panic notifier registration fails, probe
> removes the debugfs entries but leaves the delayed work scheduled. The
> work can then access devm-managed data after the failed probe tears it
> down.
> 
> Add a dedicated error label for failures after successful console log
> setup. Earlier failures keep using the existing debugfs-only cleanup
> path.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/2] platform/chrome: cros_ec_debugfs: clean up console log on probe failure
      commit: 5d187600c4603b8f7812b12ce359a11ad7a7fd3a
[2/2] platform/chrome: cros_ec_debugfs: unregister panic notifier
      commit: e5954d3031fb55dd31aa59bae477d63c68e941c0

Thanks!
