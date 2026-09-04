Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B86A3D7D7E
	for <chrome-platform@lists.linux.dev>; Fri,  4 Sep 2026 07:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508597; cv=none; b=GOwimX5537QysvBQ43pP9m8wxXUclgjopOAausNPg+mIYMf+whynQ74RZWzB8Vr7jBHn0p6k6yMlHDM6PQ/AH3atfFrxpG0Bc75PPBF0eDO8QmxYOTiOjNBCSy7n76j262XDjOQo4iF+jHJIFTJDwIJRp93qEU4enQBhBXHSQjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508597; c=relaxed/simple;
	bh=+4h4TSl0//oXGI4CShdAGAoshwpvy5iygQ02nuTM4jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eEruMy+BvdzniNonCBBX3PSQIs1qdruHZmGc1xkI7UjV91I5EoC7jWcAXuFGVfVzguiKi276ZzwbMbs532pAlzq9UsZem/M3oJB7oJevoX1RpR1pOJJTyOn08j01HDflPIllSTCG2qHJCf3BCOjJYwZopO+6yNZFZk1lU5ocvvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/M+IlXY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/M+IlXY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58FD41F00ADB;
	Fri,  4 Sep 2026 07:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788508595;
	bh=hy+k9mZjcfT/WsTkR4bxjFjHmjjsyvjCscH/Knf5eKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y/M+IlXYmEFAauYwx4450LRJszn1jZDeVeCgBcAqS7yJoLs1DlB8DBxfvMd3v2U2p
	 MJnxLAdWY7o8R4QNQdQgih+nb2VJzGJi7cwtKwsWYcWZ7+x+PJ1tL0q42SWTlpmgrF
	 MYwly+BB4dMndgKUk4Y0y++NjgteCmzN6i3xUybTXUywMOX6UI9AwsQBrv13LC9gai
	 1fBBBZCSVAj27A1qNxCo4rvdPSjqHOFvpAR5Bodop8a/njmHAmIgfik1eCYhoqIFvR
	 7HdzQY87FQmFB6jsqo4CHsaNVq58b63wgrC1mic7QPLx0rXcr4/wzlThzippxQGSpz
	 NjTCxfqkmI0QQ==
Date: Fri, 4 Sep 2026 07:56:33 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>
Cc: chrome-platform@lists.linux.dev
Subject: Re: [PATCH] platform/chrome: cros_ec_proto: Simplify
 cros_ec_wait_until_complete()
Message-ID: <app5sZPTYDAodBlT@google.com>
References: <20260902100651.274749-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902100651.274749-1-tzungbi@kernel.org>

On Wed, Sep 02, 2026 at 10:06:51AM +0000, Tzung-Bi Shih wrote:
> There is no need to defer the return out of the loop.  Replace the
> `break` with an immediate `return -EPROTO`.
> 
> With the `break` removed, execution only reaches the end of the function
> if it exhausts all EC_COMMAND_RETRIES.  The post-loop check is therefore
> redundant and replaced with an unconditional `return -EAGAIN`.
>
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: cros_ec_proto: Simplify cros_ec_wait_until_complete()
      commit: 7b6344a49cf5fed1879ee5c125d01a2535fbd725

Thanks!
